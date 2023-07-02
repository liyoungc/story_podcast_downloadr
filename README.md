# story_podcast_downloadr
小孩很愛聽podcast，但有時車上沒有網路訊號，有時邊開車邊找app太高難度。有一個充滿下載好的故事mp3超級方便！（建議準備64Gb以上）
這個方法可以簡單地下載台灣小孩聽的故事Podcast，存入隨身碟。
如果維持原本的目錄和檔名，還可以隔一陣子再跑一次更新（除非集數從兩位數變三位數，那檔名編號就會大改，要重新刪掉重新下載）。

1. 打開命令提示畫面（Windows: 執行"cmd"; Mac: 搜尋 terminal)

2. 下載youtube-dl，是個超好用、合法又開源的影音下載程式。
　　建議用套件管理軟體安裝 (Mac: homebrew; Windows: Chocolatey)

3. 進入要存Podcasts的根目錄，或使用者的根目錄（例如隨身碟）
For Mac　若隨身碟叫USB_name
> cd /Volumes/USB_name 

For Windows 若隨身碟在E槽
> cd E: 

4. 下載podcasts.csv, fetch.bat (Windows) or fetch.sh (Mac) 並存入

5. 執行下載程式

For Mac
> zsh ./fetch.sh

For Windows
> fetch.bat

6. 讓電腦跑好一陣子慢慢下載

7. 如果要加入新的podcast, 可以在 podcasts.csv 最下面加一行: 
> Podcast名稱, Google podcast　的網址