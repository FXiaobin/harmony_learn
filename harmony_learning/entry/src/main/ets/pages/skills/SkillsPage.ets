@Entry
@Component
export struct SkillsPage {

  build(){

    Navigation() {
      Column() {
        Text('SkillsPage')

      }
      .width('100%')
      .height('100%')
      .backgroundColor($r('app.color.color_pageBackground'))
    }
    .mode(NavigationMode.Auto)
    .title('功能')
    .titleMode(NavigationTitleMode.Mini)
    .hideBackButton(true)
    .backgroundColor($r('app.color.color_primary'))
    .width('100%')
    .height('100%')

  }



}