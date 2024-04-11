
import {NavigationBarView} from '@maple/navigationbarview'

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Column() {

      NavigationBarView({
        title: '首页',
        titleColor: $r('app.color.color_white'),
        showBack: false,
        // navHeight: 56
      })
        // .backgroundColor(Color.Orange)



      Text(this.message)
        .fontSize(50)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.color_primary'))
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f3f3f3')
  }
}