###################################################################################
#  TVerRec : TVerダウンローダ
#
#		TVer固有関数スクリプト
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

#アイコンを設定
$script:iconBase64 = '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'

#----------------------------------------------------------------------
#TVerRec最新化確認
#----------------------------------------------------------------------
function checkLatestTVerRec {
	[OutputType([System.Void])]
	Param ()

	$progressPreference = 'silentlyContinue'
	goAnal -Event 'launch'
	$local:versionUp = $false

	#TVerRecの最新バージョン取得
	$local:repo = 'dongaba/TVerRec'
	$local:releases = "https://api.github.com/repos/$($local:repo)/releases"
	try {
		$local:appReleases = (Invoke-RestMethod `
				-Uri $local:releases `
				-Method Get `
		)
	} catch { return }

	#GitHub側最新バージョンの整形
	# v1.2.3 → 1.2.3
	$local:latestVersion = $($local:appReleases)[0].Tag_Name.Trim('v', ' ')
	# v1.2.3 beta 4 → 1.2.3
	$local:latestMajorVersion = $local:latestVersion.split(' ')[0]

	#ローカル側バージョンの整形
	# v1.2.3 beta 4 → 1.2.3
	$local:appMajorVersion = $script:appVersion.split(' ')[0]

	#バージョン判定
	#最新バージョンのメジャーバージョンが大きい場合
	if ($local:latestMajorVersion -gt $local:appMajorVersion ) { $local:versionUp = $true }
	elseif ($local:latestMajorVersion -eq $local:appMajorVersion ) {
		#マイナーバージョンが設定されている場合
		if ( $local:appMajorVersion -ne $script:appVersion) { $local:versionUp = $true }
		#バージョンが完全に一致する場合
		else { $local:versionUp = $false }
		#ローカルバージョンの方が新しい場合
	} else { $local:versionUp = $false }

	$progressPreference = 'Continue'

	#バージョンアップメッセージ
	if ($local:versionUp -eq $true ) {
		[Console]::ForegroundColor = 'Green'
		Write-Warning 'TVerRecの更新版があるようです。'
		Write-Warning "　Local Version $script:appVersion "
		Write-Warning "　Latest Version  $local:latestVersion"
		Write-Output ''
		[Console]::ResetColor()

		#変更履歴の表示
		for ($i = 0; $i -lt $local:appReleases.Length; $i++) {
			if ($local:appReleases[$i].Tag_Name.Trim('v', ' ') -ge $local:appMajorVersion ) {
				[Console]::ForegroundColor = 'Green'
				Write-Output '----------------------------------------------------------------------'
				Write-Output "$($local:appReleases[$i].Tag_Name.Trim('v', ' ')) の更新内容"
				Write-Output '----------------------------------------------------------------------'
				Write-Output $local:appReleases[$i].body.Replace('###', '■')
				Write-Output ''
				[Console]::ResetColor()
			}
		}

		#アップデート実行
		Write-Warning '10秒後にTVerRecをアップデートします。中止したい場合は Ctrl+C で中断してください'
		foreach ($i in (1..10)) {
			Write-Progress `
				-Activity "残り$(10 - $i)秒..." `
				-PercentComplete ([int]((100 * $i) / 10))
			Start-Sleep -Second 1
		}
		. $(Join-Path $script:scriptRoot '/functions/update_tverrec.ps1')

		#再起動のため強制終了
		exit 1

	}

}

#----------------------------------------------------------------------
#ytdlの最新化確認
#----------------------------------------------------------------------
function checkLatestYtdl {
	[OutputType([System.Void])]
	Param ()

	$progressPreference = 'silentlyContinue'

	if ($script:disableUpdateYoutubedl -eq $false) {
		if ($script:preferredYoutubedl -eq 'yt-dlp')
		{ . $(Convert-Path (Join-Path $scriptRoot './functions/update_yt-dlp.ps1')) }
		elseif ($script:preferredYoutubedl -eq 'ytdl-patched')
		{ . $(Convert-Path (Join-Path $scriptRoot './functions/update_ytdl-patched.ps1')) }
		else { Write-Error 'youtube-dlの取得元の指定が無効です' ; exit 1 }
		if ($? -eq $false) { Write-Error 'youtube-dlの更新に失敗しました' ; exit 1 }
	}

	$progressPreference = 'Continue'
}

#----------------------------------------------------------------------
#ffmpegの最新化確認
#----------------------------------------------------------------------
function checkLatestFfmpeg {
	[OutputType([System.Void])]
	Param ()

	$progressPreference = 'silentlyContinue'

	if ($script:disableUpdateFfmpeg -eq $false) {
		. $(Convert-Path (Join-Path $scriptRoot './functions/update_ffmpeg.ps1'))
		if ($? -eq $false) { Write-Error 'ffmpegの更新に失敗しました' ; exit 1 }
	}

	$progressPreference = 'Continue'
}

#----------------------------------------------------------------------
#設定で指定したファイル・ディレクトリの存在チェック
#----------------------------------------------------------------------
function checkRequiredFile {
	[OutputType([System.Void])]
	Param ()

	if (!(Test-Path $script:downloadBaseDir -PathType Container))
	{ Write-Error '番組ダウンロード先ディレクトリが存在しません。終了します。' ; exit 1 }
	if (!(Test-Path $script:downloadWorkDir -PathType Container))
	{ Write-Error 'ダウンロード作業ディレクトリが存在しません。終了します。' ; exit 1 }
	if ($script:saveBaseDir -ne '') {
		$script:saveBaseDirArray = @()
		$script:saveBaseDirArray = $script:saveBaseDir.split(';')
		foreach ($saveDir in $script:saveBaseDirArray) {
			if (!(Test-Path $saveDir -PathType Container))
			{ Write-Error '番組移動先ディレクトリが存在しません。終了します。' ; exit 1 }
		}
	}
	if (!(Test-Path $script:ytdlPath -PathType Leaf))
	{ Write-Error 'youtube-dlが存在しません。終了します。' ; exit 1 }
	if (!(Test-Path $script:ffmpegPath -PathType Leaf))
	{ Write-Error 'ffmpegが存在しません。終了します。' ; exit 1 }
	if ((!(Test-Path $script:ffprobePath -PathType Leaf)) -And ($script:simplifiedValidation -eq $true))
	{ Write-Error 'ffprobeが存在しません。終了します。' ; exit 1 }

	#過去のバージョンで使用していたファイルを削除、または移行
	#tver.lockをhistory.lockに移行(v2.6.5→v2.6.6)
	if (Test-Path $(Join-Path $script:dbDir 'tver.lock') -PathType Leaf) {
		Move-Item `
			-Path $(Join-Path $script:dbDir 'tver.lock') `
			-Destination $script:historyLockFilePath `
			-Force
	}
	#tver.sample.csvをhistory.sample.csvに移行(v2.6.5→v2.6.6)
	if (Test-Path $(Join-Path $script:dbDir 'tver.sample.csv') -PathType Leaf) {
		Move-Item `
			-Path $(Join-Path $script:dbDir 'tver.sample.csv') `
			-Destination $script:historyFilePath `
			-Force
	}
	#tver.csvをhistory.csvに移行(v2.6.5→v2.6.6)
	if (Test-Path $(Join-Path $script:dbDir 'tver.csv') -PathType Leaf) {
		Rename-Item `
			-Path $(Join-Path $script:dbDir 'tver.csv') `
			-NewName history.csv `
			-Force
	}
	#*.batを*.cmdに移行(v2.6.9→v2.7.0)
	if (Test-Path "$($script:winDir)/*.bat" -PathType Leaf) {
		Remove-Item `
			-Path "$($script:winDir)/*.bat" `
			-Force
	}


	#ファイルが存在しない場合はサンプルファイルをコピー
	if (!(Test-Path $script:keywordFilePath -PathType Leaf)) {
		if (!(Test-Path $script:keywordFileSamplePath -PathType Leaf))
		{ Write-Error 'ダウンロード対象キーワードファイル(サンプル)が存在しません。終了します。' ; exit 1 }
		Copy-Item `
			-Path $script:keywordFileSamplePath `
			-Destination $script:keywordFilePath `
			-Force
	}
	if (!(Test-Path $script:ignoreFilePath -PathType Leaf)) {
		if (!(Test-Path $script:ignoreFileSamplePath -PathType Leaf))
		{ Write-Error 'ダウンロード対象外番組ファイル(サンプル)が存在しません。終了します。' ; exit 1 }
		Copy-Item `
			-Path $script:ignoreFileSamplePath `
			-Destination $script:ignoreFilePath `
			-Force
	}
	if (!(Test-Path $script:historyFilePath -PathType Leaf)) {
		if (!(Test-Path $script:historyFileSamplePath -PathType Leaf))
		{ Write-Error 'ダウンロード履歴ファイル(サンプル)が存在しません。終了します。' ; exit 1 }
		Copy-Item `
			-Path $script:historyFileSamplePath `
			-Destination $script:historyFilePath `
			-Force
	}
	if (!(Test-Path $script:listFilePath -PathType Leaf)) {
		if (!(Test-Path $script:listFileSamplePath -PathType Leaf))
		{ Write-Error 'ダウンロードリストファイル(サンプル)が存在しません。終了します。' ; exit 1 }
		Copy-Item `
			-Path $script:listFileSamplePath `
			-Destination $script:listFilePath `
			-Force
	}

	#念のためチェック
	if (!(Test-Path $script:keywordFilePath -PathType Leaf))
	{ Write-Error 'ダウンロード対象キーワードファイルが存在しません。終了します。' ; exit 1 }
	if (!(Test-Path $script:ignoreFilePath -PathType Leaf))
	{ Write-Error 'ダウンロード対象外番組ファイルが存在しません。終了します。' ; exit 1 }
	if (!(Test-Path $script:historyFilePath -PathType Leaf))
	{ Write-Error 'ダウンロード履歴ファイルが存在しません。終了します。' ; exit 1 }
	if (!(Test-Path $script:listFilePath -PathType Leaf))
	{ Write-Error 'ダウンロードリストファイルが存在しません。終了します。' ; exit 1 }
}

#----------------------------------------------------------------------
#ダウンロード対象キーワードの読み込み
#----------------------------------------------------------------------
function loadKeywordList {
	[OutputType([String[]])]
	Param ()

	try {
		$local:keywordNames = `
			[String[]](Get-Content $script:keywordFilePath -Encoding UTF8 `
			| Where-Object { !($_ -match '^\s*$') } `	#空行を除く
			| Where-Object { !($_ -match '^#.*$') })	#コメント行を除く
	} catch { Write-Error 'ダウンロード対象キーワードの読み込みに失敗しました' ; exit 1 }

	return $local:keywordNames
}

#----------------------------------------------------------------------
#ダウンロードリストの読み込み
#----------------------------------------------------------------------
function loadDownloadList {
	[OutputType([String[]])]
	Param ()

	try {
		#ロックファイルをロック
		while ($(fileLock $script:listLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$local:videoLinks = `
			Import-Csv `
			-Path $script:listFilePath `
			-Encoding UTF8 `
		| Select-Object episodeID `						#EpisodeIDのみ抽出
		| Where-Object { !($_ -match '^\s*$') } `		#空行を除く
		| Where-Object { !($_.episodeID -match '^#') }	#ダウンロード対象外を除く
	} catch { Write-Error 'ダウンロードリストの読み込みに失敗しました' ; exit 1
	} finally { $null = fileUnlock $script:listLockFilePath }

	return $local:videoLinks
}

#----------------------------------------------------------------------
#ダウンロード対象外番組の読み込み
#----------------------------------------------------------------------
function getIgnoreList {
	[OutputType([String[]])]
	Param ()

	try {
		#ロックファイルをロック
		while ($(fileLock $script:ignoreLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$local:ignoreTitles = `
			[String[]](Get-Content $script:ignoreFilePath -Encoding UTF8 `
			| Where-Object { !($_ -match '^\s*$') } `		#空行を除く
			| Where-Object { !($_ -match '^;.*$') })		#コメント行を除く
	} catch { Write-Error 'ダウンロード対象外の読み込みに失敗しました' ; exit 1
	} finally { $null = fileUnlock $script:ignoreLockFilePath }

	return $local:ignoreTitles
}

#----------------------------------------------------------------------
#ダウンロード対象外番組の読み込(正規表現判定用)
#----------------------------------------------------------------------
function getRegexIgnoreList {
	[OutputType([String[]])]
	Param ()

	try {
		#ロックファイルをロック
		while ($(fileLock $script:ignoreLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$local:ignoreRegexTitles = @()
		$local:ignoreRegexTitles = `
			[String[]](Get-Content $script:ignoreFilePath -Encoding UTF8 `
			| Where-Object { !($_ -match '^\s*$') } `		#空行を除く
			| Where-Object { !($_ -match '^;.*$') })		#コメント行を除く
	} catch { Write-Error 'ダウンロード対象外の読み込みに失敗しました' ; exit 1
	} finally { $null = fileUnlock $script:ignoreLockFilePath }

	if ($null -ne $local:ignoreRegexTitles ) {
		for ($i = 0; $i -lt $local:ignoreRegexTitles.Length; $i++) {
			#正規表現用のエスケープ
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('\', '\\')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('*', '\*')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('+', '\+')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('.', '\.')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('?', '\?')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('{', '\{')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('}', '\}')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('(', '\(')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace(')', '\)')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('[', '\[')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace(']', '\]')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('^', '\^')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('$', '\$')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('-', '\-')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('|', '\|')
			$local:ignoreRegexTitles[$i] = $local:ignoreRegexTitles[$i].Replace('/', '\/')
		}
	}

	return $local:ignoreRegexTitles
}

#----------------------------------------------------------------------
#ダウンロード対象外番組のソート(使用したものを上に移動)
#----------------------------------------------------------------------
function sortIgnoreList {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Alias('ignoreTitle')]
		[String]$local:ignoreTitle
	)

	$local:ignoreListNew = @()
	$local:ignoreComment = @()
	$local:ignoreTarget = @()
	$local:ignoreElse = @()

	#正規表現用のエスケープ解除
	$local:ignoreTitle = $local:ignoreTitle.Replace('\\', '\')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\*', '*')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\+', '+')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\.', '.')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\?', '?')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\{', '{')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\}', '}')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\(', '(')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\)', ')')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\[', '[')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\]', ']')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\^', '^')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\$', '$')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\-', '-')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\|', '|')
	$local:ignoreTitle = $local:ignoreTitle.Replace('\/', '/')

	try {
		#ロックファイルをロック
		while ($(fileLock $script:ignoreLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$local:ignoreLists = (Get-Content $script:ignoreFilePath -Encoding UTF8).`
			Where( { !($_ -match '^\s*$') }).`		#空行を除く
		Where( { !($_ -match '^;;.*$') })		#ヘッダ行を除く
	} catch { Write-Error 'ダウンロード対象外リストの読み込みに失敗しました' ; exit 1
	} finally { $null = fileUnlock $script:ignoreLockFilePath }

	$local:ignoreComment = (Get-Content $script:ignoreFileSamplePath -Encoding UTF8)
	$local:ignoreTarget = $ignoreLists | Where-Object { $_ -eq $local:ignoreTitle }
	$local:ignoreElse = $ignoreLists | Where-Object { $_ -ne $local:ignoreTitle }

	$local:ignoreListNew += $local:ignoreComment
	$local:ignoreListNew += $local:ignoreTarget
	$local:ignoreListNew += $local:ignoreElse

	try {
		#ロックファイルをロック
		while ($(fileLock $script:ignoreLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		#改行コードLFを強制
		$local:ignoreListNew | ForEach-Object { $_ + "`n" } | Out-File `
			-Path $script:ignoreFilePath `
			-Encoding UTF8 `
			-NoNewline
		Write-Debug 'ダウンロード対象外リストのソート更新完了'
	} catch {
		Copy-Item `
			Path $($script:ignoreFilePath + '.' + $local:timeStamp) `
			-Destination $script:ignoreFilePath `
			-Force
		Write-Error 'ダウンロード対象外リストのソートに失敗しました' ; exit 1
	} finally {
		$null = fileUnlock $script:ignoreLockFilePath
		#ダウンロード対象外番組の読み込み
		$script:ignoreRegExTitles = getRegExIgnoreList
	}

}


#----------------------------------------------------------------------
#TVerのAPI Tokenを取得
#----------------------------------------------------------------------
function getToken () {
	[OutputType([System.Void])]
	Param ()

	$local:tverTokenURL = 'https://platform-api.tver.jp/v2/api/platform_users/browser/create'
	$local:requestHeader = @{
		'Content-Type' = 'application/x-www-form-urlencoded'
	}
	$local:requestBody = 'device_type=pc'
	$local:tokenResponse = `
		Invoke-RestMethod `
		-Uri $local:tverTokenURL `
		-Method 'POST' `
		-Headers $local:requestHeader `
		-Body $local:requestBody `
		-TimeoutSec $script:timeoutSec
	$script:platformUID = $local:tokenResponse.Result.platform_uid
	$script:platformToken = $local:tokenResponse.Result.platform_token
}

#----------------------------------------------------------------------
#キーワードから番組のリンクへの変換
#----------------------------------------------------------------------
function getVideoLinksFromKeyword {
	[OutputType([System.Object[]])]
	Param ([String]$local:keywordName)

	$script:requestHeader = @{
		'x-tver-platform-type' = 'web'
		'Origin'               = 'https://tver.jp'
		'Referer'              = 'https://tver.jp'
	}
	$script:tverLinks = @()
	if ( $local:keywordName.IndexOf('https://tver.jp') -eq 0) {
		#URL形式の場合番組ページのLinkを取得
		try {
			$local:keywordNamePage = Invoke-WebRequest `
				-Uri $local:keywordName `
				-TimeoutSec $script:timeoutSec
		} catch { Write-Warning '情報取得エラー。スキップします Err:00' ; continue }
		try {
			$script:tverLinks = (
				$local:keywordNamePage.Links `
				| Where-Object { `
					(href -Like '*lp*') `
						-Or (href -Like '*corner*') `
						-Or (href -Like '*series*') `
						-Or (href -Like '*episode*') `
						-Or (href -Like '*feature*')`
				} `
				| Select-Object href
			).href
		} catch { Write-Warning '情報取得エラー。スキップします Err:01'; continue }

	} elseif ($local:keywordName.IndexOf('series/') -eq 0) {
		#番組IDによる番組検索から番組ページのLinkを取得
		$local:seriesID = trimComment($local:keywordName).Replace('series/', '').Trim()
		goAnal -Event 'search' -Type 'series' -ID $local:seriesID
		try { $script:tverLinks = getLinkFromSeriesID ($local:seriesID) }
		catch { Write-Warning '情報取得エラー。スキップします Err:02' ; continue }

	} elseif ($local:keywordName.IndexOf('talents/') -eq 0) {
		#タレントIDによるタレント検索から番組ページのLinkを取得
		$local:talentID = trimComment($local:keywordName).Replace('talents/', '').Trim()
		goAnal -Event 'search' -Type 'talent' -ID $local:talentID
		try { $script:tverLinks = getLinkFromTalentID ($local:talentID) }
		catch { Write-Warning '情報取得エラー。スキップします Err:03' ; continue }

	} elseif ($local:keywordName.IndexOf('tag/') -eq 0) {
		#ジャンルなどのTag情報から番組ページのLinkを取得
		$local:tagID = trimComment($local:keywordName).Replace('tag/', '').Trim()
		goAnal -Event 'search' -Type 'tag' -ID $local:tagID
		try { $script:tverLinks = getLinkFromTag ($local:tagID) }
		catch { Write-Warning '情報取得エラー。スキップします Err:04'; continue }

	} elseif ($local:keywordName.IndexOf('new/') -eq 0) {
		#新着番組から番組ページのLinkを取得
		$local:genre = trimComment($local:keywordName).Replace('new/', '').Trim()
		goAnal -Event 'search' -Type 'new' -ID $local:genre
		try { $script:tverLinks = getLinkFromNew ($local:genre) }
		catch { Write-Warning '情報取得エラー。スキップします Err:05'; continue }

	} elseif ($local:keywordName.IndexOf('ranking/') -eq 0) {
		#ランキングによる番組ページのLinkを取得
		$local:genre = trimComment($local:keywordName).Replace('ranking/', '').Trim()
		goAnal -Event 'search' -Type 'ranking' -ID $local:genre
		try { $script:tverLinks = getLinkFromRanking ($local:genre) }
		catch { Write-Warning '情報取得エラー。スキップします Err:06'; continue }

	} elseif ($local:keywordName.IndexOf('toppage') -eq 0) {
		#トップページから番組ページのLinkを取得
		goAnal -Event 'search' -Type 'toppage'
		try { $script:tverLinks = getLinkFromTopPage }
		catch { Write-Warning '情報取得エラー。スキップします Err:07'; continue }

	} elseif ($local:keywordName.IndexOf('title/') -eq 0) {
		#番組名による新着検索から番組ページのLinkを取得
		$local:titleName = trimComment($local:keywordName).Replace('title/', '').Trim()
		goAnal -Event 'search' -Type 'title' -ID $local:titleName
		Write-Warning '番組名検索は廃止されました。スキップします Err:08'
		continue

	} else {
		#タレント名や番組名などURL形式でない場合APIで検索結果から番組ページのLinkを取得
		goAnal -Event 'search' -Type 'free' -ID $local:keywordName
		try { $script:tverLinks = getLinkFromFreeKeyword ($local:keywordName) }
		catch { Write-Warning '情報取得エラー。スキップします Err:09'; continue }
	}

	$script:tverLinks = $script:tverLinks | Sort-Object | Get-Unique

	if ($script:tverLinks -is [Array]) {
		for ( $i = 0; $i -lt $script:tverLinks.Length; $i++) {
			$script:tverLinks[$i] = 'https://tver.jp' + $script:tverLinks[$i]
		}
	} elseif ($null -ne $script:tverLinks)
	{ $script:tverLinks = 'https://tver.jp' + $script:tverLinks }

	return $script:tverLinks
}

#----------------------------------------------------------------------
#SeriesIDによる番組検索から番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromSeriesID {
	[OutputType([System.Object[]])]
	Param ([String]$local:seriesID)

	$local:seasonLinks = @()
	$local:callSearchBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callSeriesSeasons/'

	#まずはSeries→Seasonに変換
	$local:callSearchURL =
	$local:callSearchBaseURL + $local:seriesID.Replace('series/', '') `
		+ '?platform_uid=' + $script:platformUID `
		+ '&platform_token=' + $script:platformToken
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++)
	{ $local:seasonLinks += $local:searchResults[$i].Content.Id }

	#次にSeason→Episodeに変換
	foreach ( $local:seasonLink in $local:seasonLinks)
	{ $script:tverLinks += getLinkFromSeasonID ($local:seasonLink) }
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#TalentIDによるタレント検索から番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromTalentID {
	[OutputType([System.Object[]])]
	Param ([String]$local:talentID)

	$local:callSearchBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callTalentEpisode/'
	$local:callSearchURL = `
		$local:callSearchBaseURL + $local:talentID.Replace('talents/', '') `
		+ '?platform_uid=' + $script:platformUID `
		+ '&platform_token=' + $script:platformToken
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++) {
		switch ($local:searchResults[$i].type) {
			'episode' {
				$script:tverLinks += `
					'/episodes/' + $local:searchResults[$i].Content.Id
				break
			}
			'season' {
				$script:tverLinks += `
					getLinkFromSeasonID ($local:searchResults[$i].Content.Id)
				break
			}
			'series' {
				$script:tverLinks += `
					getLinkFromSeriesID ($local:searchResults[$i].Content.Id)
				break
			}
			'live' { break }
			#他にはないと思われるが念のため
			default {
				$script:tverLinks += `
					'/' + $local:searchResults[$i].type `
					+ '/' + $local:searchResults[$i].Content.Id
				break
			}
		}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#タグから番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromTag {
	[OutputType([System.Object[]])]
	Param ([String]$local:tagID)

	$local:callSearchBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callTagSearch'
	$local:callSearchURL = `
		$local:callSearchBaseURL + '/' + $local:tagID.Replace('tag/', '') `
		+ '?platform_uid=' + $script:platformUID `
		+ '&platform_token=' + $script:platformToken
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++) {
		switch ($local:searchResults[$i].type) {
			'episode' {
				$script:tverLinks += `
					'/episodes/' + $local:searchResults[$i].Content.Id
				break
			}
			'season' {
				$script:tverLinks += `
					getLinkFromSeasonID ($local:searchResults[$i].Content.Id)
				break
			}
			'series' {
				$script:tverLinks += `
					getLinkFromSeriesID ($local:searchResults[$i].Content.Id)
				break
			}
			'live' { break }
			#他にはないと思われるが念のため
			default {
				$script:tverLinks += `
					'/' + $local:searchResults[$i].type `
					+ '/' + $local:searchResults[$i].Content.Id
				break
			}
		}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#新着から番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromNew {
	[OutputType([System.Object[]])]
	Param ([String]$local:genre)

	$local:callSearchBaseURL = `
		'https://service-api.tver.jp/api/v1/callNewerDetail'
	$local:callSearchURL = `
		$local:callSearchBaseURL + '/' + $local:genre.Replace('new/', '') `
		+ '?platform_uid=' + $script:platformUID `
		+ '&platform_token=' + $script:platformToken
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++) {
		switch ($local:searchResults[$i].type) {
			'episode' {
				$script:tverLinks += `
					'/episodes/' + $local:searchResults[$i].Content.Id
				break
			}
			'season' {
				$script:tverLinks += `
					getLinkFromSeasonID ($local:searchResults[$i].Content.Id)
				break
			}
			'series' {
				$script:tverLinks += `
					getLinkFromSeriesID ($local:searchResults[$i].Content.Id)
				break
			}
			'live' { break }
			#他にはないと思われるが念のため
			default {
				$script:tverLinks += `
					'/' + $local:searchResults[$i].type `
					+ '/' + $local:searchResults[$i].Content.Id
				break
			}
		}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#ランキングから番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromRanking {
	[OutputType([System.Object[]])]
	Param ([String]$local:genre)

	$local:callSearchBaseURL = `
		'https://service-api.tver.jp/api/v1/callEpisodeRanking'
	if ($local:genre -eq 'all') {
		$local:callSearchURL = `
			$local:callSearchBaseURL `
			+ '?platform_uid=' + $script:platformUID `
			+ '&platform_token=' + $script:platformToken
	} else {
		$local:callSearchURL = `
			$local:callSearchBaseURL `
			+ 'Detail/' + $local:genre.Replace('ranking/', '') `
			+ '?platform_uid=' + $script:platformUID `
			+ '&platform_token=' + $script:platformToken
	}
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++) {
		switch ($local:searchResults[$i].type) {
			'episode' {
				$script:tverLinks += `
					'/episodes/' + $local:searchResults[$i].Content.Id
				break
			}
			'season' {
				$script:tverLinks += `
					getLinkFromSeasonID ($local:searchResults[$i].Content.Id)
				break
			}
			'series' {
				$script:tverLinks += `
					getLinkFromSeriesID ($local:searchResults[$i].Content.Id)
				break
			}
			'live' { break }
			#他にはないと思われるが念のため
			default {
				$script:tverLinks += `
					'/' + $local:searchResults[$i].type `
					+ '/' + $local:searchResults[$i].Content.Id
				break
			}
		}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#トップページから番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromTopPage {
	[OutputType([System.Object[]])]
	Param ()

	$local:callSearchBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callHome'
	$local:callSearchURL = `
		$local:callSearchBaseURL + `
		'?platform_uid=' + $script:platformUID + `
		'&platform_token=' + $script:platformToken
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Components
	$local:searchResultCount = $local:searchResults.Length
	for ($i = 0; $i -lt $local:searchResultCount; $i++) {
		if ($local:searchResults[$i].Type -eq 'horizontal' `
				-Or $local:searchResults[$i].Type -eq 'ranking' `
				-Or $local:searchResults[$i].Type -eq 'talents' `
				-Or $local:searchResults[$i].type -eq 'billboard' `
				-Or $local:searchResults[$i].type -eq 'episodeRanking' `
				-Or $local:searchResults[$i].type -eq 'newer' `
				-Or $local:searchResults[$i].type -eq 'ender' `
				-Or $local:searchResults[$i].type -eq 'talent' `
				-Or $local:searchResults[$i].type -eq 'special') {
			#横スクロール型 or 総合ランキング or 注目タレント or 特集
			$local:searchSectionResultCount = $local:searchResults[$i].Contents.Length
			for ($j = 0; $j -lt $local:searchSectionResultCount; $j++) {
				switch ($local:searchResults[$i].contents[$j].type) {
					'episode' {
						$script:tverLinks += `
							'/episodes/' + $local:searchResults[$i].contents[$j].Content.Id
						break
					}
					'season' {
						$script:tverLinks += `
							getLinkFromSeasonID ($local:searchResults[$i].contents[$j].Content.Id)
						break
					}
					'series' {
						$script:tverLinks += `
							getLinkFromSeriesID ($local:searchResults[$i].contents[$j].Content.Id)
						break
					}
					'talent' {
						$script:tverLinks += `
							getLinkFromTalentID ($local:searchResults[$i].contents[$j].Content.Id)
						break
					}
					'live' { break }
					'specialMain' {
						#特集ページ。パース方法不明
						#https://tver.jp/specials/$($local:searchResults[4].contents.content.id)
						#$local:searchResults[4].contents.content.id
						#callSpecialContentsDetailを再帰的に呼び出す必要がありそう
						#https://platform-api.tver.jp/service/api/v1/callSpecialContents/drama-digest?require_data=mylist[special][drama-digest]
						#を呼んで得られたspecialContents>[TypeがSpecialのもの]>contents.content.idを使って、再度以下のように呼び出し。(以下の例ではsum22-latterhal)
						#https://platform-api.tver.jp/service/api/v1/callSpecialContentsDetail/sum22-latterhalf?sort_key=newer&require_data=mylist, later
						#他にはないと思われるが念のため
						break
					}
					default {
						$script:tverLinks += `
							'/' + $local:searchResults[$i].contents[$j].type `
							+ '/' + $local:searchResults[$i].contents[$j].Content.Id
						break
					}
				}
			}
		} elseif ($local:searchResults[$i].type -eq 'topics') {
			$local:searchSectionResultCount = $local:searchResults[$i].Contents.Length
			for ($j = 0; $j -lt $local:searchSectionResultCount; $j++) {
				$local:searchSectionResultCount = $local:searchResults[$i].Contents.Length
				for ($j = 0; $j -lt $local:searchSectionResultCount; $j++) {
					switch ($local:searchResults[$i].contents[$j].Content.Content.type) {
						'episode' {
							$script:tverLinks += `
								'/episodes/' + $local:searchResults[$i].contents[$j].Content.Content.Content.Id
							break
						}
						'season' {
							$script:tverLinks += `
								getLinkFromSeasonID ($local:searchResults[$i].contents[$j].Content.Content.Content.Id)
							break
						}
						'series' {
							$script:tverLinks += `
								getLinkFromSeriesID ($local:searchResults[$i].contents[$j].Content.Content.Content.Id)
							break
						}
						'talent' {
							$script:tverLinks += `
								getLinkFromTalentID ($local:searchResults[$i].contents[$j].Content.Content.Content.Id)
							break
						}
						'live' { break }
						#他にはないと思われるが念のため
						default {
							$script:tverLinks += `
								'/' + $local:searchResults[$i].contents[$j].type `
								+ '/' + $local:searchResults[$i].contents[$j].Content.Content.Content.Id
							break
						}
					}
				}
			}
		} elseif ($local:searchResults[$i].type -eq 'banner') {
			#広告
			#URLは $($local:searchResults[$i].contents.content.targetURL)
			#$local:searchResults[$i].contents.content.targetURL
		} elseif ($local:searchResults[$i].type -eq 'resume') {
			#続きを見る
			#ブラウザのCookieを処理しないといけないと思われるため対応予定なし
		} else {}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#TVerのAPIを叩いてフリーワード検索
#----------------------------------------------------------------------
function getLinkFromFreeKeyword {
	[OutputType([System.Object[]])]
	Param ([String]$local:keywordName)

	$local:tverSearchBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callKeywordSearch'
	$local:tverSearchURL = `
		$local:tverSearchBaseURL `
		+ '?platform_uid=' + $script:platformUID `
		+ '&platform_token=' + $script:platformToken `
		+ '&keyword=' + $local:keywordName
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:tverSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++) {
		switch ($local:searchResults[$i].type) {
			'episode' {
				$script:tverLinks += '/episodes/' + $local:searchResults[$i].Content.Id
				break
			}
			'season' {
				$script:tverLinks += `
					getLinkFromSeasonID ($local:searchResults[$i].Content.Id)
				break
			}
			'series' {
				$script:tverLinks += `
					getLinkFromSeriesID ($local:searchResults[$i].Content.Id)
				break
			}
			'live' { break }
			#他にはないと思われるが念のため
			default {
				$script:tverLinks += `
					'/' + $local:searchResults[$i].type `
					+ '/' + $local:searchResults[$i].Content.Id
				break
			}
		}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#SeasonIDによる番組検索から番組ページのLinkを取得
#----------------------------------------------------------------------
function getLinkFromSeasonID {
	[OutputType([System.Object[]])]
	Param ([String]$local:SeasonID)

	$local:tverSearchBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callSeasonEpisodes/'
	$local:callSearchURL = `
		$local:tverSearchBaseURL + $local:SeasonID.Replace('season/', '') `
		+ '?platform_uid=' + $script:platformUID `
		+ '&platform_token=' + $script:platformToken
	$local:searchResultsRaw = `
		Invoke-RestMethod `
		-Uri $local:callSearchURL `
		-Method 'GET' `
		-Headers $script:requestHeader `
		-TimeoutSec $script:timeoutSec
	$local:searchResults = $local:searchResultsRaw.Result.Contents
	for ($i = 0; $i -lt $local:searchResults.Length; $i++) {
		switch ($local:searchResults[$i].type) {
			'episode' {
				$script:tverLinks += `
					'/episodes/' + $local:searchResults[$i].Content.Id
				break
			}
			'season' {
				$script:tverLinks += `
					getLinkFromSeasonID ($local:searchResults[$i].Content.Id)
				break
			}
			'series' {
				$script:tverLinks += `
					getLinkFromSeriesID ($local:searchResults[$i].Content.Id)
				break
			}
			'live' { break }
			#他にはないと思われるが念のため
			default {
				$script:tverLinks += `
					'/' + $local:searchResults[$i].type `
					+ '/' + $local:searchResults[$i].Content.Id
				break
			}
		}
	}
	[System.GC]::Collect()

	return $script:tverLinks | Sort-Object | Get-Unique
}

#----------------------------------------------------------------------
#youtube-dlプロセスの確認と待機
#----------------------------------------------------------------------
function waitTillYtdlProcessGetFewer {
	[OutputType([System.Void])]
	Param ([Int32]$local:parallelDownloadFileNum)

	$local:psCmd = 'ps'

	switch ($script:preferredYoutubedl) {
		'yt-dlp' { $local:processName = 'yt-dlp' ; break }
		'ytdl-patched' { $local:processName = 'youtube-dl' ; break }
	}

	#youtube-dlのプロセスが設定値を超えたら一時待機
	try {
		switch ($true) {
			$IsWindows {
				$local:ytdlCount = [Math]::Round(
					(Get-Process -ErrorAction Ignore -Name youtube-dl).`
						Count / 2, [MidpointRounding]::AwayFromZero)
				break
			}
			$IsLinux {
				$local:ytdlCount = `
				@(Get-Process -ErrorAction Ignore -Name $local:processName).Count
				break
			}
			$IsMacOS {
				$local:ytdlCount = `
				(& $local:psCmd | grep youtube-dl | grep -v grep | grep -c ^).Trim()
				break
			}
			default { $local:ytdlCount = 0 ; break }
		}
	} catch { $local:ytdlCount = 0 }			#プロセス数が取れなくてもとりあえず先に進む

	Write-Verbose "現在のダウンロードプロセス一覧 ($local:ytdlCount 個)"

	while ([int]$local:ytdlCount -ge [int]$local:parallelDownloadFileNum ) {
		Write-Output "ダウンロードが $local:parallelDownloadFileNum 多重に達したので一時待機します。 ($(getTimeStamp))"
		Write-Verbose "現在のダウンロードプロセス一覧 ($local:ytdlCount 個)"
		Start-Sleep -Seconds 60			#1分待機
		try {
			switch ($true) {
				$IsWindows {
					$local:ytdlCount = [Math]::Round(
						(Get-Process -ErrorAction Ignore -Name youtube-dl).`
							Count / 2, [MidpointRounding]::AwayFromZero)
					break
				}
				$IsLinux {
					$local:ytdlCount = `
					@(Get-Process -ErrorAction Ignore -Name $local:processName).Count
					break
				}
				$IsMacOS {
					$local:ytdlCount = `
					(& $local:psCmd | grep youtube-dl | grep -v grep | grep -c ^).Trim()
					break
				}
			}
		} catch { Write-Debug 'youtube-dlのプロセス数の取得に失敗しました'; $local:ytdlCount = 0 }
	}
}

#----------------------------------------------------------------------
#TVer番組ダウンロードのメイン処理
#----------------------------------------------------------------------
function downloadTVerVideo {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Alias('Keyword')]
		[String]$script:keywordName,

		[Parameter(Mandatory = $true, Position = 1)]
		[Alias('URL')]
		[String]$script:videoPageURL,

		[Parameter(Mandatory = $true, Position = 2)]
		[Alias('Link')]
		[String]$script:videoLink
	)

	$script:videoName = '' ; $script:videoFilePath = '' ; $script:videoSeriesPageURL = ''
	$script:broadcastDate = '' ; $script:videoSeries = '' ; $script:videoSeason = ''
	$script:videoEpisode = '' ; $script:videoTitle = ''
	$script:mediaName = '' ; $script:descriptionText = ''
	$script:newVideo = $null
	$script:ignore = $false ; $script:skip = $false

	#TVerのAPIを叩いて番組情報取得
	goAnal -Event 'getinfo' -Type 'link' -ID $script:videoLink
	try { getVideoInfo -Link $script:videoLink }
	catch { Write-Warning '情報取得エラー。スキップします Err:10'; continue }

	#ダウンロードファイル情報をセット
	$script:videoName = getVideoFileName `
		-Series $script:videoSeries `
		-Season $script:videoSeason `
		-Episode $script:videoEpisode `
		-Title $script:videoTitle `
		-Date $script:broadcastDate

	$script:videoFileDir = getSpecialCharacterReplaced (
		getNarrowChars $($script:videoSeries + ' ' + $script:videoSeason)).Trim(' ', '.')
	if ($script:sortVideoByMedia -eq $true) {
		$script:videoFileDir = $(
			Join-Path $script:downloadBaseDir $(getFileNameWoInvChars $script:mediaName) `
			| Join-Path -ChildPath $(getFileNameWoInvChars $script:videoFileDir)
		)
	} else {
		$script:videoFileDir = $(
			Join-Path $script:downloadBaseDir $(getFileNameWoInvChars $script:videoFileDir)
		)
	}
	$script:videoFilePath = $(Join-Path $script:videoFileDir $script:videoName)
	$script:videoFileRelPath = $script:videoFilePath.`
		Replace($script:downloadBaseDir, '').Replace('\', '/')
	$script:videoFileRelPath = $script:videoFileRelPath.`
		Substring(1, $($script:videoFileRelPath.Length - 1))

	#番組情報のコンソール出力
	showVideoInfo `
		-Name $script:videoName `
		-Date $script:broadcastDate `
		-Media $script:mediaName `
		-Description $descriptionText
	if ($DebugPreference -ne 'SilentlyContinue') {
		showVideoDebugInfo `
			-URL $script:videoPageURL `
			-SeriesURL $script:videoSeriesPageURL `
			-Keyword $script:keywordName `
			-Series $script:videoSeries `
			-Season $script:videoSeason `
			-Episode $script:videoEpisode `
			-Title $script:videoTitle `
			-Path $script:videoFilePath `
			-Time $(getTimeStamp) `
			-EndTime $script:endTime
	}

	#番組タイトルが取得できなかった場合はスキップ次の番組へ
	if ($script:videoName -eq '.mp4')
	{ Write-Warning '番組タイトルを特定できませんでした。スキップします'; continue }

	#ファイルが既に存在する場合はスキップフラグを立ててダウンロード履歴に書き込み処理へ
	if (Test-Path $script:videoFilePath) {

		#リストファイルにチェック済の状態で存在するかチェック
		$local:historyMatch = $script:historyFileData `
		| Where-Object { $_.videoPath -eq $script:videoFileRelPath } `
		| Where-Object { $_.videoValidated -eq '1' }

		#結果が0件ということは未検証のファイルがあるということ
		if ( $null -eq $local:historyMatch) {
			Write-Warning 'すでにダウンロード済ですが未検証の番組です。ダウンロード履歴に追加します'
			$script:skip = $true
		} else { Write-Warning 'すでにダウンロード済・検証済の番組です。スキップします'; continue }

	} else {

		Write-Debug "$(Get-Date) Ignore Check Start"
		foreach ($local:ignoreRegexTitle in $script:ignoreRegexTitles) {
			$script:ignore = checkIfIgnored `
				-ignoreRegexText $local:ignoreRegexTitle `
				-seriesTitle $script:videoSeries `
				-fileName $script:videoName
			if ($script:ignore -eq $true) { break }
		}
		Write-Debug "$(Get-Date) Ignore Check End"
		Write-Debug "Ignored: $($script:ignore)"

	}

	#スキップフラグが立っているかチェック
	if ($script:ignore -eq $true) {
		Write-Output '　ダウンロード対象外としたファイルをダウンロード履歴に追加します'
		$script:newVideo = [pscustomobject]@{
			videoPage       = $script:videoPageURL
			videoSeriesPage = $script:videoSeriesPageURL
			genre           = $script:keywordName
			series          = $script:videoSeries
			season          = $script:videoSeason
			title           = $script:videoTitle
			media           = $script:mediaName
			broadcastDate   = $script:broadcastDate
			downloadDate    = $(getTimeStamp)
			videoDir        = $script:videoFileDir
			videoName       = '-- IGNORED --'
			videoPath       = '-- IGNORED --'
			videoValidated  = '0'
		}
	} elseif ($script:skip -eq $true) {
		Write-Output '　ダウンロード済の未検証のファイルをダウンロード履歴に追加します'
		$script:newVideo = [pscustomobject]@{
			videoPage       = $script:videoPageURL
			videoSeriesPage = $script:videoSeriesPageURL
			genre           = $script:keywordName
			series          = $script:videoSeries
			season          = $script:videoSeason
			title           = $script:videoTitle
			media           = $script:mediaName
			broadcastDate   = $script:broadcastDate
			downloadDate    = $(getTimeStamp)
			videoDir        = $script:videoFileDir
			videoName       = '-- SKIPPED --'
			videoPath       = $videoFileRelPath
			videoValidated  = '0'
		}
	} else {
		Write-Output '　ダウンロードするファイルをダウンロード履歴に追加します'
		$script:newVideo = [pscustomobject]@{
			videoPage       = $script:videoPageURL
			videoSeriesPage = $script:videoSeriesPageURL
			genre           = $script:keywordName
			series          = $script:videoSeries
			season          = $script:videoSeason
			title           = $script:videoTitle
			media           = $script:mediaName
			broadcastDate   = $script:broadcastDate
			downloadDate    = $(getTimeStamp)
			videoDir        = $script:videoFileDir
			videoName       = $script:videoName
			videoPath       = $script:videoFileRelPath
			videoValidated  = '0'
		}
	}

	#ダウンロード履歴CSV書き出し
	try {
		#ロックファイルをロック
		while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$script:newVideo | Export-Csv `
			-Path $script:historyFilePath `
			-NoTypeInformation `
			-Encoding UTF8 `
			-Append
		Write-Debug 'ダウンロード履歴を書き込みました'
	} catch { Write-Warning 'ダウンロード履歴を更新できませんでした。スキップします'; continue
	} finally { $null = fileUnlock $script:historyLockFilePath }
	$script:historyFileData = `
		Import-Csv `
		-Path $script:historyFilePath `
		-Encoding UTF8

	#スキップやダウンロード対象外でなければyoutube-dl起動
	if (($script:ignore -eq $true) -Or ($script:skip -eq $true)) {
		#スキップ対象やダウンロード対象外は飛ばして次のファイルへ
		continue
	} else {
		#移動先ディレクトリがなければ作成
		if (-Not (Test-Path $script:videoFileDir -PathType Container)) {
			try {
				$null = New-Item `
					-ItemType Directory `
					-Path $script:videoFileDir `
					-Force
			} catch { Write-Warning '移動先ディレクトリを作成できませんでした'; continue }
		}

		#youtube-dl起動
		try { executeYtdl $script:videoPageURL }
		catch { Write-Warning 'youtube-dlの起動に失敗しました' }
		#5秒待機
		Start-Sleep -Seconds 5

	}

}

#----------------------------------------------------------------------
#TVer番組ダウンロードリスト作成のメイン処理
#----------------------------------------------------------------------
function generateTVerVideoList {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Alias('Keyword')]
		[String]$script:keywordName,

		[Parameter(Mandatory = $true, Position = 1)]
		[Alias('Link')]
		[String]$script:videoLink
	)

	$script:videoName = '' ; $script:videoFilePath = '' ; $script:videoSeriesPageURL = ''
	$script:broadcastDate = '' ; $script:videoSeries = '' ; $script:videoSeason = ''
	$script:videoEpisode = '' ; $script:videoTitle = ''
	$script:mediaName = '' ; $script:descriptionText = ''
	$local:ignoreWord = ''
	$script:newVideo = $null
	$script:ignore = $false ; $script:skip = $false

	#TVerのAPIを叩いて番組情報取得
	goAnal -Event 'getinfo' -Type 'link' -ID $script:videoLink
	try { getVideoInfo -Link $script:videoLink }
	catch { Write-Warning '情報取得エラー。スキップします Err:10'; continue }

	#ダウンロード対象外に入っている番組の場合はリスト出力しない
	foreach ($local:ignoreRegexTitle in $script:ignoreRegexTitles) {

		if ($(getNarrowChars $script:videoSeries) -match $(getNarrowChars $local:ignoreRegexTitle)) {
			$local:ignoreWord = $local:ignoreRegexTitle
			sortIgnoreList $local:ignoreRegexTitle
			$script:ignore = $true
			#ダウンロード対象外と合致したものはそれ以上のチェック不要
			break
		} elseif ($(getNarrowChars $script:videoTitle) -match $(getNarrowChars $local:ignoreRegexTitle)) {
			$local:ignoreWord = $local:ignoreRegexTitle
			sortIgnoreList $local:ignoreRegexTitle
			$script:ignore = $true
			#ダウンロード対象外と合致したものはそれ以上のチェック不要
			break
		}
	}

	#スキップフラグが立っているかチェック
	if ($script:ignore -eq $true) {
		Write-Output '　番組をコメントアウトした状態でリストファイルに追加します'
		$script:newVideo = [pscustomobject]@{
			seriesName    = $script:videoSeries
			seriesID      = $script:videoSeriesID
			seasonName    = $script:videoSeason
			seasonID      = $script:videoSeasonID
			episodeNo     = $script:videoEpisode
			episodeName   = $script:videoTitle
			episodeID     = '#' + $($script:videoLink.Replace('https://tver.jp/episodes/', ''))
			media         = $script:mediaName
			provider      = $script:providerName
			broadcastDate = $script:broadcastDate
			endTime       = $script:endTime
			keyword       = $script:keywordName
			ignoreWord    = $local:ignoreWord
		}
	} else {
		Write-Output '　番組をリストファイルに追加します'
		$script:newVideo = [pscustomobject]@{
			seriesName    = $script:videoSeries
			seriesID      = $script:videoSeriesID
			seasonName    = $script:videoSeason
			seasonID      = $script:videoSeasonID
			episodeNo     = $script:videoEpisode
			episodeName   = $script:videoTitle
			episodeID     = $($script:videoLink.Replace('https://tver.jp/episodes/', ''))
			media         = $script:mediaName
			provider      = $script:providerName
			broadcastDate = $script:broadcastDate
			endTime       = $script:endTime
			keyword       = $script:keywordName
			ignoreWord    = ''
		}
	}

	#ダウンロードリストCSV書き出し
	try {
		#ロックファイルをロック
		while ($(fileLock $script:listLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$script:newVideo | Export-Csv `
			-Path $script:listFilePath `
			-NoTypeInformation `
			-Encoding UTF8 `
			-Append
		Write-Debug 'ダウンロードリストを書き込みました'
	} catch { Write-Warning 'ダウンロードリストを更新できませんでした。スキップします'; continue
	} finally { $null = fileUnlock $script:listLockFilePath }
	$script:listFileData = `
		Import-Csv `
		-Path $script:listFilePath `
		-Encoding UTF8

}

#----------------------------------------------------------------------
#TVerのAPIを叩いて番組情報取得
#----------------------------------------------------------------------
function getVideoInfo {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Alias('Link')]
		[String]$local:videoLink
	)

	$local:episodeID = $local:videoLink.`
		Replace('https://tver.jp/', '').`
		Replace('https://tver.jp', '').`
		Replace('/episodes/', '').`
		Replace('episodes/', '')

	#----------------------------------------------------------------------
	#番組説明以外
	$local:tverVideoInfoBaseURL = `
		'https://platform-api.tver.jp/service/api/v1/callEpisode/'
	$local:requestHeader = @{
		'x-tver-platform-type' = 'web'
	}
	$local:tverVideoInfoURL = `
		$local:tverVideoInfoBaseURL + $local:episodeID + `
		'?platform_uid=' + $script:platformUID + `
		'&platform_token=' + $script:platformToken
	$local:response = `
		Invoke-RestMethod `
		-Uri $local:tverVideoInfoURL `
		-Method 'GET' `
		-Headers $local:requestHeader `
		-TimeoutSec $script:timeoutSec

	#シリーズ
	#	$response.Result.Series.Content.Title
	#	$response.Result.Episode.Content.SeriesTitle
	#		Series.Content.Titleだと複数シーズンがある際に現在メインで配信中のシリーズ名が返ってくることがある
	#		Episode.Content.SeriesTitleだとSeries名+Season名が設定される番組もある
	#	なのでSeries.Content.TitleとEpisode.Content.SeriesTitleの短い方を採用する
	if ($local:response.Result.Episode.Content.SeriesTitle.Length `
			-le $local:response.Result.Series.Content.Title.Length ) {
		$script:videoSeries = $(getSpecialCharacterReplaced (getNarrowChars (
					$local:response.Result.Episode.Content.SeriesTitle))).Trim()
	} else {
		$script:videoSeries = $(getSpecialCharacterReplaced (getNarrowChars (
					$local:response.Result.Series.Content.Title))).Trim()
	}
	$script:videoSeriesID = $local:response.Result.Series.Content.Id
	$script:videoSeriesPageURL = `
		'https://tver.jp/series/' + $local:response.Result.Series.Content.Id

	#シーズン
	#Season Name
	#	$response.Result.Season.Content.Title
	$script:videoSeason = $(getSpecialCharacterReplaced (getNarrowChars (
				$local:response.Result.Season.Content.Title))).Trim()
	$script:videoSeasonID = $local:response.Result.Season.Content.Id

	#エピソード
	#	$response.Result.Episode.Content.Title
	$script:videoTitle = $(getSpecialCharacterReplaced (getNarrowChars (
				$local:response.Result.Episode.Content.Title))).Trim()
	$script:videoEpisodeID = $local:response.Result.Episode.Content.Id

	#放送局
	#	$response.Result.Episode.Content.BroadcasterName
	#	$response.Result.Episode.Content.ProductionProviderName
	$script:mediaName = $(getSpecialCharacterReplaced (getNarrowChars (
				$local:response.Result.Episode.Content.BroadcasterName))).Trim()
	$script:providerName = $(getSpecialCharacterReplaced (getNarrowChars (
				$local:response.Result.Episode.Content.ProductionProviderName))).Trim()

	#放送日
	#	$response.Result.Episode.Content.BroadcastDateLabel
	$script:broadcastDate = $(getNarrowChars (
			$response.Result.Episode.Content.BroadcastDateLabel).`
			Replace('ほか', '').Replace('放送分', '放送')).Trim()

	#配信終了日時
	#	$response.Result.Episode.Content.endAt
	$script:endTime = $(getNarrowChars ($response.Result.Episode.Content.endAt)).Trim()
	$script:endTime = $(unixTimeToDateTime ($script:endTime)).AddHours(9)

	#----------------------------------------------------------------------
	#番組説明
	$local:versionNum = $local:response.result.episode.content.version
	$local:tverVideoInfoBaseURL = `
		'https://statics.tver.jp/content/episode/'
	$local:requestHeader = @{
		'origin'  = 'https://tver.jp'
		'referer' = 'https://tver.jp'
	}
	$local:tverVideoInfoURL = `
		$local:tverVideoInfoBaseURL `
		+ $local:episodeID + '.json?v=' + $local:versionNum
	$local:videoInfo = `
		Invoke-RestMethod `
		-Uri $local:tverVideoInfoURL `
		-Method 'GET' `
		-Headers $local:requestHeader `
		-TimeoutSec $script:timeoutSec
	$script:descriptionText = $(getNarrowChars ($local:videoInfo.Description).`
			Replace('&amp;', '&')).Trim()
	$script:videoEpisode = getNarrowChars ($local:videoInfo.No)

	#----------------------------------------------------------------------
	#各種整形

	#「《」と「》」で挟まれた文字を除去
	if ($script:removeSpecialNote -eq $true) {
		if ($script:videoSeries -match '(.*)(《.*》)(.*)')
		{ $script:videoSeries = $($Matches[1] + $Matches[3]).Replace('  ', ' ').Trim() }
		if ($script:videoSeason -match '(.*)(《.*》)(.*)')
		{ $script:videoSeason = $($Matches[1] + $Matches[3]).Replace('  ', ' ').Trim() }
		if ($script:videoTitle -match '(.*)(《.*》)(.*)')
		{ $script:videoTitle = $($Matches[1] + $Matches[3]).Replace('  ', ' ').Trim() }
	}

	#シーズン名が本編の場合はシーズン名をクリア
	if ($script:videoSeason -eq '本編') { $script:videoSeason = '' }

	#シリーズ名がシーズン名を含む場合はシーズン名をクリア
	if ($script:videoSeries -like $('*' + $script:videoSeason + '*' ))
	{ $script:videoSeason = '' }

	#放送日を整形
	$local:broadcastYMD = $null
	if ($script:broadcastDate -match '([0-9]+)(月)([0-9]+)(日)(.+?)(放送)') {
		#当年だと仮定して放送日を抽出
		$local:broadcastYMD = [DateTime]::ParseExact(
			(Get-Date -Format 'yyyy') `
				+ $Matches[1].padleft(2, '0') `
				+ $Matches[3].padleft(2, '0'), 'yyyyMMdd', $null)
		#実日付の翌日よりも放送日が未来だったら当年ではなく昨年の番組と判断する
		#(年末の番組を年初にダウンロードするケース)
		if ((Get-Date).AddDays(+1) -lt $local:broadcastYMD)
		{ $script:broadcastDate = (Get-Date).AddYears(-1).ToString('yyyy') + '年' }
		else { $script:broadcastDate = (Get-Date).ToString('yyyy') + '年' }
		$script:broadcastDate += `
			$Matches[1].padleft(2, '0') + $Matches[2] `
			+ $Matches[3].padleft(2, '0') + $Matches[4] `
			+ $Matches[6]
	}

}

#----------------------------------------------------------------------
#保存ファイル名を設定
#----------------------------------------------------------------------
function getVideoFileName {
	[OutputType([String])]
	Param (
		[Parameter(Mandatory = $false, Position = 0)]
		[Alias('Series')]
		[String]$local:videoSeries,

		[Parameter(Mandatory = $false, Position = 1)]
		[Alias('Season')]
		[String]$local:videoSeason,

		[Parameter(Mandatory = $false, Position = 2)]
		[Alias('Episode')]
		[String]$local:videoEpisode,

		[Parameter(Mandatory = $false, Position = 3)]
		[Alias('Title')]
		[String]$local:videoTitle,

		[Parameter(Mandatory = $false, Position = 4)]
		[Alias('Date')]
		[String]$local:broadcastDate
	)

	#ファイル名を生成
	if ($script:addEpisodeNumber -eq $true) {
		$local:videoName = `
			$local:videoSeries `
			+ ' ' + $local:videoSeason `
			+ ' ' + $local:broadcastDate `
			+ ' Ep' + $local:videoEpisode `
			+ ' ' + $local:videoTitle
	} else {
		$local:videoName = `
			$local:videoSeries `
			+ ' ' + $local:videoSeason `
			+ ' ' + $local:broadcastDate `
			+ ' ' + $local:videoTitle
	}

	#ファイル名にできない文字列を除去
	$local:videoName = $(getFileNameWoInvChars (getSpecialCharacterReplaced (
				getNarrowChars $local:videoName))).Replace('  ', ' ').Trim()

	#SMBで255バイトまでしかファイル名を持てないらしいので、超えないようにファイル名をトリミング
	$local:videoNameTemp = ''
	#youtube-dlの中間ファイル等を考慮して安全目の上限値
	$local:fileNameLimit = $script:fileNameLengthMax - 25
	$local:videoNameByte = [System.Text.Encoding]::UTF8.GetByteCount($local:videoName)

	#ファイル名を1文字ずつ増やしていき、上限に達したら残りは「……」とする
	if ($local:videoNameByte -gt $local:fileNameLimit) {
		for ($i = 1 ; [System.Text.Encoding]::UTF8.`
				GetByteCount($local:videoNameTemp) -lt $local:fileNameLimit ; $i++) {
			$local:videoNameTemp = $local:videoName.Substring(0, $i)
		}
		#ファイル名省略の印
		$local:videoName = $local:videoNameTemp + '……'
	}

	$local:videoName = $local:videoName + '.mp4'
	if ($local:videoName.Contains('.mp4') -eq $false)
	{ Write-Error '　ダウンロードファイル名の設定がおかしいです' }

	return $local:videoName
}

#----------------------------------------------------------------------
#番組情報表示
#----------------------------------------------------------------------
function showVideoInfo {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $false, Position = 0)]
		[Alias('Name')]
		[String]$local:videoName,

		[Parameter(Mandatory = $false, Position = 1)]
		[Alias('Date')]
		[String]$local:broadcastDate,

		[Parameter(Mandatory = $false, Position = 2)]
		[Alias('Media')]
		[String]$local:mediaName,

		[Parameter(Mandatory = $false, Position = 3)]
		[Alias('Description')]
		[String]$local:descriptionText
	)

	Write-Output "　番組名 :$local:videoName"
	Write-Output "　放送日 :$local:broadcastDate"
	Write-Output "　テレビ局:$local:mediaName"
	Write-Output "　番組説明:$local:descriptionText"
}
#----------------------------------------------------------------------
#番組情報デバッグ表示
#----------------------------------------------------------------------
function showVideoDebugInfo {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $false, Position = 0)]
		[Alias('URL')]
		[String]$local:videoPageURL,

		[Parameter(Mandatory = $false, Position = 1)]
		[Alias('SeriesURL')]
		[String]$local:videoSeriesPageURL,

		[Parameter(Mandatory = $false, Position = 2)]
		[Alias('Keyword')]
		[String]$local:keywordName,

		[Parameter(Mandatory = $false, Position = 3)]
		[Alias('Series')]
		[String]$local:videoSeries,

		[Parameter(Mandatory = $false, Position = 4)]
		[Alias('Season')]
		[String]$local:videoSeason,

		[Parameter(Mandatory = $false, Position = 5)]
		[Alias('Episode')]
		[String]$local:videoEpisode,

		[Parameter(Mandatory = $false, Position = 6)]
		[Alias('Title')]
		[String]$local:videoTitle,

		[Parameter(Mandatory = $false, Position = 7)]
		[Alias('Path')]
		[String]$local:videoFilePath,

		[Parameter(Mandatory = $false, Position = 8)]
		[Alias('Time')]
		[String]$local:processedTime,

		[Parameter(Mandatory = $false, Position = 9)]
		[Alias('EndTime')]
		[String]$local:endTime
	)

	Write-Debug	"番組エピソードページ:$local:videoPageURL"
	Write-Debug	"番組シリーズページ :$local:videoSeriesPageURL"
	Write-Debug	"キーワード :$local:keywordName"
	Write-Debug	"シリーズ :$local:videoSeries"
	Write-Debug	"シーズン :$local:videoSeason"
	Write-Debug	"エピソード :$local:videoEpisode"
	Write-Debug	"サブタイトル :$local:videoTitle"
	Write-Debug	"ファイル :$local:videoFilePath"
	Write-Debug	"取得日付 :$local:processedTime"
	Write-Debug	"配信終了 :$local:endTime"
}

#----------------------------------------------------------------------
#youtube-dlプロセスの起動
#----------------------------------------------------------------------
function executeYtdl {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $false, Position = 0)]
		[Alias('URL')]
		[String]$local:videoPageURL
	)

	goAnal -Event 'download'

	$local:tmpDir = '"temp:' + $script:downloadWorkDir + '"'
	$local:saveDir = '"home:' + $script:videoFileDir + '"'
	$local:subttlDir = '"subtitle:' + $script:downloadWorkDir + '"'
	$local:thumbDir = '"thumbnail:' + $script:downloadWorkDir + '"'
	$local:chaptDir = '"chapter:' + $script:downloadWorkDir + '"'
	$local:descDir = '"description:' + $script:downloadWorkDir + '"'
	$local:saveFile = '"' + $script:videoName + '"'
	$local:ffmpegPath = '"' + $script:ffmpegPath + '"'

	$local:ytdlArgs = '--format mp4'
	$local:ytdlArgs += ' --console-title'
	$local:ytdlArgs += ' --no-mtime'
	$local:ytdlArgs += ' --retries 10'
	$local:ytdlArgs += ' --fragment-retries 10'
	$local:ytdlArgs += ' --abort-on-unavailable-fragment'
	$local:ytdlArgs += ' --no-keep-fragments'
	$local:ytdlArgs += ' --abort-on-error'
	$local:ytdlArgs += ' --no-continue'
	$local:ytdlArgs += ' --windows-filenames'
	$local:ytdlArgs += ' --newline'
	$local:ytdlArgs += " --concurrent-fragments $script:parallelDownloadNumPerFile"
	$local:ytdlArgs += ' --embed-thumbnail'
	$local:ytdlArgs += ' --all-subs'
	$local:ytdlArgs += ' --embed-subs'
	$local:ytdlArgs += ' --embed-metadata'
	$local:ytdlArgs += ' --embed-chapters'
	$local:ytdlArgs += " --paths $local:saveDir"
	$local:ytdlArgs += " --paths $local:tmpDir"
	$local:ytdlArgs += " --paths $local:subttlDir"
	$local:ytdlArgs += " --paths $local:thumbDir"
	$local:ytdlArgs += " --paths $local:chaptDir"
	$local:ytdlArgs += " --paths $local:descDir"
	$local:ytdlArgs += " --ffmpeg-location $local:ffmpegPath"
	$local:ytdlArgs += " --output $local:saveFile"
	$local:ytdlArgs += " $local:videoPageURL"

	if ($IsWindows) {
		try {
			Write-Debug "youtube-dl起動コマンド:$script:ytdlPath $local:ytdlArgs"
			$null = Start-Process `
				-FilePath $script:ytdlPath `
				-ArgumentList $local:ytdlArgs `
				-PassThru `
				-WindowStyle $script:windowShowStyle
		} catch { Write-Error 'youtube-dlの起動に失敗しました' ; return }
	} else {
		Write-Debug "youtube-dl起動コマンド:nohup $script:ytdlPath $local:ytdlArgs"
		try {
			$null = Start-Process `
				-FilePath nohup `
				-ArgumentList ($script:ytdlPath, $local:ytdlArgs) `
				-PassThru `
				-RedirectStandardOutput /dev/null `
				-RedirectStandardError /dev/zero
		} catch { Write-Error '　youtube-dlの起動に失敗しました' ; return }
	}
}

#----------------------------------------------------------------------
#youtube-dlのプロセスが終わるまで待機
#----------------------------------------------------------------------
function waitTillYtdlProcessIsZero () {
	[OutputType([System.Void])]
	Param ()

	$local:psCmd = 'ps'

	switch ($script:preferredYoutubedl) {
		'yt-dlp' { $local:processName = 'yt-dlp' ; break }
		'ytdl-patched' { $local:processName = 'youtube-dl' ; break }
	}

	try {
		switch ($true) {
			$IsWindows {
				$local:ytdlCount = [Math]::Round(
					(Get-Process -ErrorAction Ignore -Name youtube-dl).`
						Count / 2, [MidpointRounding]::AwayFromZero )
				break
			}
			$IsLinux {
				$local:ytdlCount = @(Get-Process -ErrorAction Ignore -Name $local:processName).Count
				break
			}
			$IsMacOS {
				$local:ytdlCount = (& $local:psCmd | grep youtube-dl | grep -v grep | grep -c ^).Trim()
				break
			}
			default { $local:ytdlCount = 0 ; break }
		}
	} catch { $local:ytdlCount = 0 }

	while ($local:ytdlCount -ne 0) {
		try {
			Write-Verbose "現在のダウンロードプロセス一覧 ($local:ytdlCount 個)"
			Start-Sleep -Seconds 60			#1分待機
			switch ($true) {
				$IsWindows {
					$local:ytdlCount = [Math]::Round(
						(Get-Process -ErrorAction Ignore -Name youtube-dl).`
							Count / 2, [MidpointRounding]::AwayFromZero )
					break
				}
				$IsLinux {
					$local:ytdlCount = @(Get-Process -ErrorAction Ignore -Name $local:processName).Count
					break
				}
				$IsMacOS {
					$local:ytdlCount = (& $local:psCmd | grep youtube-dl | grep -v grep | grep -c ^).Trim()
					break
				}
				default { $local:ytdlCount = 0 ; break }
			}
		} catch { $local:ytdlCount = 0 }
	}
}

#----------------------------------------------------------------------
#ダウンロード履歴の不整合を解消
#----------------------------------------------------------------------
function cleanDB {
	[OutputType([System.Void])]
	Param ()

	$local:historyData0 = @()
	$local:historyData1 = @()
	$local:historyData2 = @()
	$local:mergedHistoryData = @()

	try {
		#ロックファイルをロック
		while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }

		#ファイル操作
		#videoValidatedが空白でないもの
		$local:historyData = ((Import-Csv -Path $script:historyFilePath -Encoding UTF8).`
				Where({ $null -ne $_.videoValidated }))
		$local:historyData0 = (($local:historyData).Where({ $_.videoValidated -eq '0' }))
		$local:historyData1 = (($local:historyData).Where({ $_.videoValidated -eq '1' }))
		$local:historyData2 = (($local:historyData).Where({ $_.videoValidated -eq '2' }))

		$local:mergedHistoryData += $local:historyData0
		$local:mergedHistoryData += $local:historyData1
		$local:mergedHistoryData += $local:historyData2
		$local:mergedHistoryData | Sort-Object -Property downloadDate `
		| Export-Csv `
			-Path $script:historyFilePath `
			-NoTypeInformation `
			-Encoding UTF8

	} catch { Write-Warning 'ダウンロード履歴の更新に失敗しました'
	} finally { $null = fileUnlock $script:historyLockFilePath }
}

#----------------------------------------------------------------------
#30日以上前に処理したものはダウンロード履歴から削除
#----------------------------------------------------------------------
function purgeDB {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Alias('RetentionPeriod')]
		[Int32]$local:retentionPeriod
	)

	try {
		#ロックファイルをロック
		while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$local:purgedHist = ((Import-Csv -Path $script:historyFilePath -Encoding UTF8).`
				Where({ [DateTime]::ParseExact($_.downloadDate, 'yyyy-MM-dd HH:mm:ss', $null) -gt $(Get-Date).`
						AddDays(-1 * [Int32]$local:retentionPeriod) }))
		$local:purgedHist | Export-Csv `
			-Path $script:historyFilePath `
			-NoTypeInformation `
			-Encoding UTF8
	} catch { Write-Warning 'ダウンロード履歴のクリーンアップに失敗しました'
	} finally { $null = fileUnlock $script:historyLockFilePath }
}

#----------------------------------------------------------------------
#ダウンロード履歴の重複削除
#----------------------------------------------------------------------
function uniqueDB {
	[OutputType([System.Void])]
	Param ()

	$local:uniquedHist = @()

	try {
		#ロックファイルをロック
		while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }

		#videoPageで1つしかないもの残す
		$local:uniquedHist = `
			Import-Csv `
			-Path $script:historyFilePath `
			-Encoding UTF8 `
		| Group-Object -Property 'videoPage' `
		| Where-Object count -EQ 1 `
		| Select-Object -ExpandProperty group

		#ダウンロード日時でソートし出力
		$local:uniquedHist | Sort-Object -Property downloadDate `
		| Export-Csv `
			-Path $script:historyFilePath `
			-NoTypeInformation `
			-Encoding UTF8

	} catch { Write-Warning 'ダウンロード履歴の更新に失敗しました'
	} finally { $null = fileUnlock $script:historyLockFilePath }
}

#----------------------------------------------------------------------
#番組の整合性チェック
#----------------------------------------------------------------------
function checkVideo {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $false, Position = 0)]
		[Alias('DecodeOption')]
		[String]$local:decodeOption,

		[Parameter(Mandatory = $false, Position = 1)]
		[Alias('Path')]
		[String]$local:videoFileRelPath
	)

	$local:errorCount = 0
	$local:checkStatus = 0
	$local:videoFilePath = Join-Path $script:downloadBaseDir $local:videoFileRelPath
	try {
		$null = New-Item `
			-Path $script:ffpmegErrorLogPath `
			-ItemType File `
			-Force
	} catch { Write-Warning 'ffmpegエラーファイルを初期化できませんでした' ; return }

	#これからチェックする番組のステータスをチェック
	try {
		#ロックファイルをロック
		while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
		{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
		#ファイル操作
		$local:videoHists = `
			Import-Csv `
			-Path $script:historyFilePath `
			-Encoding UTF8
		$local:checkStatus = $(($local:videoHists).`
				Where({ $_.videoPath -eq $local:videoFileRelPath })).videoValidated
	} catch { Write-Warning "　既にダウンロード履歴から削除されたようです: $local:videoFileRelPath"; return
	} finally { $null = fileUnlock $script:historyLockFilePath }

	#0:未チェック、1:チェック済、2:チェック中
	if ($local:checkStatus -eq 2 ) { Write-Warning '他プロセスでチェック中です';	return
	} elseif ($local:checkStatus -eq 1 ) { Write-Warning '他プロセスでチェック済です'; return
	} else {
		#該当の番組のチェックステータスを"2"にして後続のチェックを実行
		try {
			$local:videoHists `
			| Where-Object { $_.videoPath -eq $local:videoFileRelPath } `
			| Where-Object { $_.videoValidated = '2' }
		} catch { Write-Warning "　該当のレコードが見つかりませんでした: $local:videoFileRelPath"; return }
		try {
			#ロックファイルをロック
			while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
			{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
			#ファイル操作
			$local:videoHists | Export-Csv `
				-Path $script:historyFilePath `
				-NoTypeInformation `
				-Encoding UTF8
		} catch { Write-Warning "　ダウンロード履歴を更新できませんでした: $local:videoFileRelPath"; return
		} finally { $null = fileUnlock $script:historyLockFilePath }
	}

	$local:checkFile = '"' + $local:videoFilePath + '"'
	goAnal -Event 'validate'

	if ($script:simplifiedValidation -eq $true) {
		#ffprobeを使った簡易検査
		$local:ffprobeArgs = ' -hide_banner -v error -err_detect explode' + " -i $local:checkFile "

		Write-Debug "ffprobe起動コマンド:$script:ffprobePath $local:ffprobeArgs"
		try {
			if ($IsWindows) {
				$local:proc = Start-Process `
					-FilePath $script:ffprobePath `
					-ArgumentList ($local:ffprobeArgs) `
					-PassThru `
					-WindowStyle $script:windowShowStyle `
					-RedirectStandardError $script:ffpmegErrorLogPath `
					-Wait
			} else {
				$local:proc = Start-Process `
					-FilePath $script:ffprobePath `
					-ArgumentList ($local:ffprobeArgs) `
					-PassThru `
					-RedirectStandardOutput /dev/null `
					-RedirectStandardError $script:ffpmegErrorLogPath `
					-Wait
			}
		} catch { Write-Error '　ffprobeを起動できませんでした' ; return }
	} else {
		#ffmpegeを使った完全検査
		$local:ffmpegArgs = "$local:decodeOption " `
			+ ' -hide_banner -v error -xerror' + " -i $local:checkFile -f null - "

		Write-Debug "ffmpeg起動コマンド:$script:ffmpegPath $local:ffmpegArgs"
		try {
			if ($IsWindows) {
				$local:proc = Start-Process `
					-FilePath $script:ffmpegPath `
					-ArgumentList ($local:ffmpegArgs) `
					-PassThru `
					-WindowStyle $script:windowShowStyle `
					-RedirectStandardError $script:ffpmegErrorLogPath `
					-Wait
			} else {
				$local:proc = Start-Process `
					-FilePath $script:ffmpegPath `
					-ArgumentList ($local:ffmpegArgs) `
					-PassThru `
					-RedirectStandardOutput /dev/null `
					-RedirectStandardError $script:ffpmegErrorLogPath `
					-Wait
			}
		} catch { Write-Error '　ffmpegを起動できませんでした' ; return }
	}

	#ffmpegが正常終了しても、大量エラーが出ることがあるのでエラーをカウント
	try {
		if (Test-Path $script:ffpmegErrorLogPath) {
			$local:errorCount = (Get-Content -LiteralPath $script:ffpmegErrorLogPath `
				| Measure-Object -Line).Lines
			Get-Content `
				-LiteralPath $script:ffpmegErrorLogPath `
				-Encoding UTF8 `
			| ForEach-Object { Write-Debug $_ }
		}
	} catch { Write-Warning 'ffmpegエラーの数をカウントできませんでした'; $local:errorCount = 9999999 }

	#エラーをカウントしたらファイルを削除
	try {
		if (Test-Path $script:ffpmegErrorLogPath) {
			Remove-Item `
				-LiteralPath $script:ffpmegErrorLogPath `
				-Force `
				-ErrorAction SilentlyContinue
		}
	} catch { Write-Warning 'ffmpegエラーファイルを削除できませんでした' }

	if ($local:proc.ExitCode -ne 0 -Or $local:errorCount -gt 30) {

		#終了コードが"0"以外 または エラーが一定以上 はダウンロード履歴とファイルを削除
		Write-Warning 'チェックNGでした'
		Write-Warning "　exit code: $($local:proc.ExitCode) error count: $local:errorCount"

		#破損しているダウンロードファイルをダウンロード履歴から削除
		try {
			#ロックファイルをロック
			while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
			{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
			#ファイル操作
			$local:videoHists = `
				Import-Csv `
				-Path $script:his`
			toryFilePath `
				-Encoding UTF8
			#該当の番組のレコードを削除
			$local:videoHists `
			| Where-Object { $_.videoPath -ne $local:videoFileRelPath } `
			| Export-Csv `
				-Path $script:historyFilePath `
				-NoTypeInformation `
				-Encoding UTF8
		} catch { Write-Warning "　ダウンロード履歴の更新に失敗しました: $local:videoFileRelPath"
		} finally { $null = fileUnlock $script:historyLockFilePath }

		#破損しているダウンロードファイルを削除
		try {
			Remove-Item `
				-LiteralPath $local:videoFilePath `
				-Force `
				-ErrorAction SilentlyContinue
		} catch { Write-Warning "　ファイル削除できませんでした: $local:videoFilePath" }

	} else {

		#終了コードが"0"のときはダウンロード履歴にチェック済フラグを立てる
		Write-Output '　チェックOKでした'
		try {
			#ロックファイルをロック
			while ($(fileLock $script:historyLockFilePath).fileLocked -ne $true)
			{ Write-Warning 'ファイルのロック解除待ち中です'; Start-Sleep -Seconds 1 }
			#ファイル操作
			$local:videoHists = `
				Import-Csv `
				-Path $script:historyFilePath `
				-Encoding UTF8
			#該当の番組のチェックステータスを"1"に
			$local:videoHists `
			| Where-Object { $_.videoPath -eq $local:videoFileRelPath } `
			| Where-Object { $_.videoValidated = '1' }
			$local:videoHists | Export-Csv `
				-Path $script:historyFilePath `
				-NoTypeInformation `
				-Encoding UTF8
		} catch { Write-Warning "　ダウンロード履歴を更新できませんでした: $local:videoFileRelPath"
		} finally { $null = fileUnlock $script:historyLockFilePath }

	}

}

#----------------------------------------------------------------------
#番組が無視されているかチェック
#----------------------------------------------------------------------
function checkIfIgnored {
	[OutputType([System.Void])]
	Param (
		[Parameter(Mandatory = $true, Position = 0)]
		[Alias('ignoreRegexText')]
		[String]$local:ignoreRegexTitle,

		[Parameter(Mandatory = $true, Position = 1)]
		[Alias('seriesTitle')]
		[String]$local:videoSeries,

		[Parameter(Mandatory = $true, Position = 2)]
		[Alias('fileName')]
		[String]$local:videoName
	)

	#ダウンロード対象外と合致したものはそれ以上のチェック不要
	if ($(getNarrowChars $local:videoName) -match $(getNarrowChars $local:ignoreRegexTitle)) {
		sortIgnoreList $local:ignoreRegexTitle
		$script:ignore = $true ; break
	} elseif ($(getNarrowChars $local:videoSeries) -match $(getNarrowChars $local:ignoreRegexTitle)) {
		sortIgnoreList $local:ignoreRegexTitle
		$script:ignore = $true ; break
	}

}
