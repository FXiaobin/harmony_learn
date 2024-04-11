@Entry
@Component
export struct NewsPage {

  build(){

    Navigation() {
      Column() {
        Text('NewsPage')

      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.color_pageBackground'))
    }
    .mode(NavigationMode.Auto)
    .title('新闻')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.color_primary'))
    .width('100%')
    .height('100%')

  }




}