@Entry
@Component
export struct NewsPage {

  @Builder navigationTitle() {
    // 要放到Column容器组件中才会居中？？？
    Column(){
      Text('新闻')
        .fontSize(22)
        .fontWeight(FontWeight.Medium)
        .fontColor(Color.White)
        .textAlign(TextAlign.Center)
        .width('100%')
        // .backgroundColor(Color.Pink)

      Text('最新资讯')
    }
    // .backgroundColor(Color.Orange)

  }


  build(){

    Row(){
      Navigation() {
        Column() {
          Text('NewsPage')

        }
        .width('100%')
        .height('100%')
        .backgroundColor($r('app.color.color_pageBackground'))
      }
      .mode(NavigationMode.Auto)
      .width('100%')
      .height('100%')
      .backgroundColor('#07c160')
      .title(this.navigationTitle())
      .titleMode(NavigationTitleMode.Mini)
      .align(Alignment.Center)
      .hideBackButton(true)
    }
    .width('100%')
    .height('100%')
  }




}