
import {NavigationBarView} from '@maple/navigationbarview'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {

      NavigationBarView({
        title: '首页',
        // showBack: false,
        backImageColor: Color.White,
      })
        // .backgroundColor(Color.Orange)



      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f3f3f3')
  }
}