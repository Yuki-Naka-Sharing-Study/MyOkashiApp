import SwiftUI

struct ContentView: View {
    // OkashiDataを参照する状態変数
    @StateObject var OkashiDataList = OkashiData()
    // 入力された文字列を保持する状態変数
    @State var inputText = ""
    
    var body: some View {
        // 文字列を受け取るTextFieldを表示する
        TextField("キーワード",
                  text: $inputText,
                  prompt: Text("キーワードを入力してください"))
        .onSubmit {
            // 入力完了直後に検索をする
            OkashiDataList.searchOkashi(keyword: inputText)
        }
        // キーボードの改行を検索に変更する
        .submitLabel(.search)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
