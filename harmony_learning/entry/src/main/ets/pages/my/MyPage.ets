@Entry
@Component
export struct MyPage {

  build(){

    Navigation() {
      Column() {
        Text('MyPage')

      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.color_pageBackground'))
    }
    .mode(NavigationMode.Auto)
    .title('我的')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.color_primary'))
    .width('100%')
    .height('100%')

  }

}