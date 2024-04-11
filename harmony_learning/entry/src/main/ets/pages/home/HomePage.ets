@Entry
@Component
export struct HomePage {

  @Builder navigationTitle() {

    Text('首页')
      .fontSize(18)
      .fontColor($r('app.color.color_white'))

  }

  build(){

    Navigation() {
      Column() {
        Text('HomePage')

      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.color_pageBackground'))
    }
    .mode(NavigationMode.Auto)
    .title({
      builder: this.navigationTitle(),
      height: 56
    })
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.color_primary'))
    .width('100%')
    .height('100%')


  }
}