###################################################################################
#  TVerRec : TVerダウンローダ
#
#		GUI設定スクリプト
#
#	Copyright (c) 2022 dongaba
#
#	Licensed under the MIT License;
#	Permission is hereby granted, free of charge, to any person obtaining a copy
#	of this software and associated documentation files (the "Software"), to deal
#	in the Software without restriction, including without limitation the rights
#	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#	copies of the Software, and to permit persons to whom the Software is
#	furnished to do so, subject to the following conditions:
#
#	The above copyright notice and this permission notice shall be included in
#	all copies or substantial portions of the Software.
#
#	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
#	THE SOFTWARE.
#
###################################################################################
using namespace System.Windows.Threading

if ($IsWindows -ne $true) { Write-Error 'Windows以外では動作しません'; Start-Sleep 10 ; exit 1 }
Add-Type -AssemblyName PresentationFramework
Add-Type -AssemblyName System.Windows.Forms

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#region 環境設定

Set-StrictMode -Version Latest
try {
	if ($MyInvocation.MyCommand.CommandType -eq 'ExternalScript') {
		$script:scriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
	} else { $script:scriptRoot = Convert-Path . }
	$script:scriptRoot = $(Convert-Path $(Join-Path $script:scriptRoot '../'))
	Set-Location $script:scriptRoot
	$script:confDir = $(Convert-Path $(Join-Path $script:scriptRoot '../conf'))
	$script:devDir = $(Join-Path $script:scriptRoot '../dev')
} catch { Write-Error 'ディレクトリ設定に失敗しました'; exit 1 }

#----------------------------------------------------------------------
#設定ファイル読み込み
try {
	. $(Convert-Path $(Join-Path $script:confDir 'system_setting.ps1'))
} catch { Write-Error '設定ファイルの読み込みに失敗しました' ; exit 1 }

#----------------------------------------------------------------------
#外部関数ファイルの読み込み
try {
	. $(Convert-Path (Join-Path $script:scriptRoot '../src/functions/common_functions.ps1'))
	. $(Convert-Path (Join-Path $script:scriptRoot '../src/functions/tver_functions.ps1'))
} catch { Write-Error '外部関数ファイルの読み込みに失敗しました' ; exit 1 }

#----------------------------------------------------------------------
#開発環境用に設定上書き
try {
	$script:devFunctionFile = $(Join-Path $script:devDir 'dev_funcitons.ps1')
	$script:devConfFile = $(Join-Path $script:devDir 'dev_setting.ps1')
	if (Test-Path $script:devFunctionFile) {
		. $script:devFunctionFile
		Write-Warning '開発ファイル用共通関数ファイルを読み込みました'
	}
	if (Test-Path $script:devConfFile) {
		. $script:devConfFile
		Write-Warning '開発ファイル用設定ファイルを読み込みました'
	}
} catch { Write-Error '開発用設定ファイルの読み込みに失敗しました' ; exit 1 }

#endregion 環境設定

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#region 関数定義
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#GUIイベントの処理
function DoWpfEvents {
	[DispatcherFrame] $local:frame = [DispatcherFrame]::new($true)
	$null = [Dispatcher]::CurrentDispatcher.BeginInvoke(
		'Background',
		[DispatcherOperationCallback] {
			param([object] $local:f)
			($local:f -as [DispatcherFrame]).Continue = $false
			return $null
		},
		$local:frame)
	[Dispatcher]::PushFrame($local:frame)
}

#user_setting.ps1から各設定項目を読み込む
function loadCurrentSetting {
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[String]$local:key
	)
	try {
		$local:lineNum = Select-String $local:key.Replace('$', '\$') $script:userSettingFile `
		| ForEach-Object { $_.LineNumber }
		$local:currentSetting = $(Select-String $local:key.Replace('$', '\$') $script:userSettingFile `
			| ForEach-Object { $_.Line }).split('=')[1].Trim()
	} catch { $local:lineNum = ''; $local:currentSetting = '' }

	return $local:lineNum, $local:currentSetting
}

#user_setting.ps1に各設定項目を書き込む
function writeSetting {

	$local:newSetting = @()
	$local:startSegment = '##Start Setting Generated from GUI'
	$local:endSegment = '##End Setting Generated from GUI'

	#自動生成部分の行数を取得
	if ( Test-Path $(Join-Path $script:confDir 'user_setting.ps1') ) {
		try {
			$local:totalLineNum = (Get-Content -Path $script:userSettingFile).Length
		} catch { $local:totalLineNum = 0 }
		try {
			$local:headLineNum = $(Select-String $local:startSegment $script:userSettingFile | ForEach-Object { $_.LineNumber }) - 1
		} catch { $local:headLineNum = 0 }
		try {
			$local:tailLineNum = $local:totalLineNum - $(Select-String $local:endSegment $script:userSettingFile | ForEach-Object { $_.LineNumber })
		} catch { $local:tailLineNum = 0 }
	} else { $local:totalLineNum = 0; $local:headLineNum = 0; $local:tailLineNum = 0 }

	#自動生成より前の部分
	if ( $local:totalLineNum -ne 0 ) {
		try { $local:newSetting += Get-Content $userSettingFile -Head $local:headLineNum }
		catch {}
	}

	#自動生成の部分
	$local:newSetting += $local:startSegment
	foreach ($local:settingAttribute in $local:settingAttributes) {
		$local:settingBoxName = $local:settingAttribute.Replace('$script:', '')
		$local:settingBox = $script:settingWindow.FindName($local:settingBoxName)
		if ($local:settingBox.Text -eq '') {
		} elseif ($local:settingBox.Text.Contains('$') `
				-Or $local:settingBox.Text.Contains('{') `
				-Or $local:settingBox.Text.Contains('(') `
				-Or [int]::TryParse($local:settingBox.Text, [ref]$null) ) {
			$local:newSetting += $local:settingAttribute + ' = ' + $local:settingBox.Text
		} else {
			$local:newSetting += $local:settingAttribute + ' = ' + '''' + $local:settingBox.Text + ''''
		}
	}
	$local:newSetting += $local:endSegment

	#自動生成より後の部分
	if ( $local:totalLineNum -ne 0 ) {
		try { $local:newSetting += Get-Content $script:userSettingFile -Tail $local:tailLineNum }
		catch {}
	}

	#改行コードをLFで出力
	Write-Output $local:newSetting `
	| ForEach-Object { $_ + "`n" } `
	| Out-File `
		-Path $script:userSettingFile `
		-Encoding UTF8 `
		-NoNewline

}

#endregion 関数定義
#----------------------------------------------------------------------

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#メイン処理
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

$script:userSettingFile = $(Join-Path $script:confDir 'user_setting.ps1')

#----------------------------------------------------------------------
#region WPFのWindow設定

try {
	[string]$local:mainXaml = Get-Content -Path '../resources/TVerRecSetting.xaml'
	$local:mainXaml = $local:mainXaml `
		-replace 'mc:Ignorable="d"', '' `
		-replace 'x:N', 'N' `
		-replace 'x:Class=".*?"', ''
	[xml]$local:mainCleanXaml = $local:mainXaml
	$script:settingWindow = [System.Windows.Markup.XamlReader]::Load((New-Object System.Xml.XmlNodeReader $local:mainCleanXaml))
} catch {
	Write-Error 'ウィンドウデザイン読み込めませんでした。TVerRecが破損しています。'
	exit 1
}

#PowerShellのウィンドウを非表示に
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]public static extern IntPtr GetConsoleWindow();
[DllImport("user32.dll")]public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
$local:console = [Console.Window]::GetConsoleWindow()
[Console.Window]::ShowWindow($local:console, 0) | Out-Null

#タスクバーのアイコンにオーバーレイ表示
$local:icon = New-Object System.Windows.Media.Imaging.BitmapImage
$local:icon.BeginInit()
$local:icon.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($script:iconBase64)
$local:icon.EndInit()
$local:icon.Freeze()
$script:settingWindow.TaskbarItemInfo.Overlay = $local:icon
$script:settingWindow.TaskbarItemInfo.Description = $script:settingWindow.Title

#ウィンドウアイコン設定
$script:settingWindow.add_Loaded({
		$script:settingWindow.Icon = $script:iconPath
	})

#閉じるボタン押下時
$script:settingWindow.Add_Closing({
	})

#Name属性を持つ要素のオブジェクト作成
$local:mainCleanXaml.SelectNodes('//*[@Name]') `
| ForEach-Object { Set-Variable -Name ($_.Name) -Value $script:settingWindow.FindName($_.Name) -Scope Script }

#WPFにロゴをロード
$local:logo = New-Object System.Windows.Media.Imaging.BitmapImage
$local:logo.BeginInit()
$local:logo.StreamSource = [System.IO.MemoryStream][System.Convert]::FromBase64String($script:logoBase64)
$local:logo.EndInit()
$local:logo.Freeze()
$script:LogoImage.Source = $local:logo

#バージョン表記
$script:lblVersion.Content = 'Version ' + $script:appVersion

#endregion WPFのWindow設定
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#region ボタンのアクション
$script:btnWiki.add_Click({ Start-Process ‘https://github.com/dongaba/TVerRec/wiki’ })
$script:btnCancel.add_Click({ $script:settingWindow.close() })
$script:btnSave.add_Click({
		writeSetting
		$script:settingWindow.close()
	})
$script:btndownloadBaseDir.add_Click({
		$script:fd.Description = 'ダウンロード先ディレクトリを選択してください'
		$script:fd.RootFolder = [System.Environment+SpecialFolder]::MyComputer
		$script:fd.SelectedPath = $script:downloadBaseDir.Text
		if ( $script:fd.ShowDialog($script:form) -eq [System.Windows.Forms.DialogResult]::OK) {
			$script:downloadBaseDir.Text = $script:fd.SelectedPath
		}
	})
$script:btndownloadWorkDir.add_Click({
		$script:fd.Description = '作業ディレクトリを選択してください'
		$script:fd.RootFolder = [System.Environment+SpecialFolder]::MyComputer
		$script:fd.SelectedPath = $script:downloadWorkDir.Text
		if ( $script:fd.ShowDialog($script:form) -eq [System.Windows.Forms.DialogResult]::OK) {
			$script:downloadWorkDir.Text = $script:fd.SelectedPath
		}
	})
$script:btnsaveBaseDir.add_Click({
		$script:fd.Description = '移動先ディレクトリを選択してください'
		$script:fd.RootFolder = [System.Environment+SpecialFolder]::MyComputer
		$script:fd.SelectedPath = $script:saveBaseDir.Text
		if ( $script:fd.ShowDialog($script:form) -eq [System.Windows.Forms.DialogResult]::OK) {
			$script:saveBaseDir.Text = $script:fd.SelectedPath
		}
	})

#endregion ボタンのアクション
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#region 設定ファイルの読み込み

$local:settingAttributes = @()
$local:settingAttributes += '$script:downloadBaseDir'
$local:settingAttributes += '$script:downloadWorkDir'
$local:settingAttributes += '$script:saveBaseDir'
$local:settingAttributes += '$script:parallelDownloadFileNum'
$local:settingAttributes += '$script:parallelDownloadNumPerFile'
$local:settingAttributes += '$script:multithreadNum'
$local:settingAttributes += '$script:timeoutSec'
$local:settingAttributes += '$script:sortVideoByMedia'
$local:settingAttributes += '$script:addEpisodeNumber'
$local:settingAttributes += '$script:removeSpecialNote'
$local:settingAttributes += '$script:preferredYoutubedl'
$local:settingAttributes += '$script:disableUpdateYoutubedl'
$local:settingAttributes += '$script:disableUpdateFfmpeg'
$local:settingAttributes += '$script:forceSoftwareDecodeFlag'
$local:settingAttributes += '$script:simplifiedValidation'
$local:settingAttributes += '$script:disableValidation'
$local:settingAttributes += '$script:windowShowStyle'
$local:settingAttributes += '$script:ffmpegDecodeOption'

$local:currentSetting = @{}

foreach ($local:settingAttribute in $local:settingAttributes) {
	$local:currentSetting[$local:settingAttribute] = loadCurrentSetting $local:settingAttribute
	$local:settingBoxName = $local:settingAttribute.Replace('$script:', '')
	$local:settingBox = $script:settingWindow.FindName($local:settingBoxName)
	$local:settingBox.Text = $(loadCurrentSetting $local:settingAttribute)[1].Trim("'")
}

#endregion 設定ファイルの読み込み
#----------------------------------------------------------------------

#----------------------------------------------------------------------
#ウィンドウ表示

try {
	$null = $script:settingWindow.Show()
	$null = $script:settingWindow.Activate()
	[Console.Window]::ShowWindow($local:console, 0) | Out-Null
} catch {
	Write-Error 'ウィンドウを描画できませんでした。TVerRecが破損しています。'
	exit 1
}

# メインウィンドウ取得
$script:process = [Diagnostics.Process]::GetCurrentProcess()
$script:form = New-Object Windows.Forms.NativeWindow
$script:form.AssignHandle($script:process.MainWindowHandle)
$script:fd = New-Object System.Windows.Forms.FolderBrowserDialog

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#ウィンドウ表示後のループ処理
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

#----------------------------------------------------------------------
#region ウィンドウ表示後のループ処理
while ($script:settingWindow.IsVisible) {
	#GUIイベント処理
	DoWpfEvents

	Start-Sleep -Milliseconds 10
}

#endregion ウィンドウ表示後のループ処理
#----------------------------------------------------------------------

#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#終了処理
#━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

