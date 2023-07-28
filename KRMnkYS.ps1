# 파일 삭제 모니터링을 위한 PowerShell 작업 정의
$작업 = Start-Job -ScriptBlock {

    # 모니터링할 경로 설정
    $경로 = "$env:USERPROFILE\Desktop"

    # 파일 시스템 감시기 초기화
    $감시기 = New-Object System.IO.FileSystemWatcher
    $감시기.Path = $경로
    $감시기.Filter = "*!경고_*.*"
    $감시기.IncludeSubdirectories = $false
    $감시기.EnableRaisingEvents = $true

    # 파일 삭제 이벤트 처리를 위한 이벤트 핸들러 정의
    $삭제된핸들러 = {
        $이벤트인자 = $args[1]
        $파일명 = $이벤트인자.Name
        $확장자 = [System.IO.Path]::GetExtension($파일명).ToLower()

        # 지원되는 확장자 목록
        $지원되는확장자목록 = @('.txt', '.docx', '.pdf', '.jpg', '.mp3')

        if ($파일명 -match '^!경고_' -and $확장자 -in $지원되는확장자목록) {
            Write-Host "파일 $($파일명) 삭제됨. $($이벤트인자.TimeGenerated)에 삭제됨"
            
            # 이미지를 저장할 경로 설정
            $이미지경로 = "$env:USERPROFILE\Desktop\Monkeys"

            # 이미지 저장 경로가 없으면 생성
            if (-not (Test-Path -Path $이미지경로 -PathType Container)) {
                New-Item -ItemType Directory -Path $이미지경로 -Force | Out-Null
            }

            # 다운로드할 이미지의 최대 개수 설정
            $최대이미지수 = 5

            # 지정된 개수만큼 반복하며 랜덤한 원숭이 이미지 다운로드
            for ($i = 1; $i -le $최대이미지수; $i++) {
                # 랜덤 파일명 생성
                $이미지파일명 = "monkey$i.jpg"

                # Unsplash API 엔드포인트 설정하여 랜덤 원숭이 이미지 검색
                $url = "https://source.unsplash.com/featured/?monkey"

                # 이미지 다운로드 및 생성된 파일명으로 지정된 경로에 저장
                Invoke-WebRequest -Uri $url -OutFile "$이미지경로\$이미지파일명"
            }
        }
    }

    # 파일 시스템 감시기에 이벤트 핸들러 등록
    Register-ObjectEvent $감시기 "Deleted" -Action $삭제된핸들러

    # 작업을 계속 실행하기 위해 무한 루프
    while ($true) {
        Start-Sleep -Seconds 60
    }
}

# 새로운 PowerShell 창을 열고 무한 루프 코드 실행
Start-Process powershell.exe "-NoExit -Command while(`$true`) { 
    `$확장자 = Get-Random -InputObject @('.txt', '.docx', '.pdf', '.jpg', '.mp3')
    `$파일명 = '!경고_' + (Get-Date -Format yyyyMMddHHmmss) + `$확장자
    `$WshShell = New-Object -comObject WScript.Shell
    `$바로가기 = `$WshShell.CreateShortcut('$env:USERPROFILE\Desktop\' + `$파일명 + '.lnk')
    `$바로가기.TargetPath = 'powershell.exe'
    `$바로가기.Save()
    Start-Sleep -Seconds 1
}"

# 사용자에게 작업 중지 요청
Read-Host "작업을 중지하려면 엔터 키를 누르세요."
Stop-Job $작업
