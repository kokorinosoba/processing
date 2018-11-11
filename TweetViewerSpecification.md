* setup function
	* PhotoSelectorとTweetSelectorからインスタンスを生成
	* 
* PhotoSelector
	* PhotoNames
		* 写真の名前を保持する変数
	* PhotoIndex
		* どの写真を表示するかのインデックスを保持する変数
	* IndexIncrement
		* インデックスを増やす
		* 増やしたときにPhotoNamesの要素の個数以上だった場合に最初に戻る
	* PhotoDisplay
		* 写真を表示するメソッド
		* 写真と同時にツイートも表示するのでこの中でツイートの表示設定と表示を行う？
* TweetSelector
	* コンストラクタ
		* getTweetFromCSVを実行
	* Tweets
		* ツイートのリストを保持する変数
	* TweetIndex
		* どのツイートを表示するかのインデックスを保持する変数
	* IndexIncrement
		* インデックスを増やすメソッド
		* 増やしたときにTweetsの要素の個数以上だった場合に0にする
	* getTweetFromCSV(Option)
		* ツイートをCSVファイルから取得するメソッド
		* CSVに更新があったかどうかを記録するCsvUpdatedの値がTrueならIndexを0にする
		* Indexを0にしたらCsvUpdatedをFalseに書き換える？（未定）
* draw function
	* PhotoSelectorの写真を表示するメソッドをを呼び出す
	* 
	* アニメーションを付ける？
* Pythonのほう
	* 時間順に並び替える（新→旧）
	* 更新があったかどうかをCsvUpdatedに書き出す
		* 更新有：True
		* 更新無：False