
@Component
export struct NewsListPage {

  @Prop typeNum: number

  build(){
    Column(){
      Text('news list page - ' + this.typeNum)

    }
    .width('100%')
    .height('100%')
    // .backgroundColor($r('app.color.color_pageBackground'))
    .backgroundColor(this.colorWith(this.typeNum))
  }

  colorWith(index: number) : Color {
    switch (index){
      case 0:
        return Color.Red
      case 1:
        return Color.Green
      case 2:
        return Color.Blue
      case 3:
        return Color.Yellow
      case 4:
        return Color.Brown
      case 5:
        return Color.Orange
      case 6:
        return Color.Gray
      default:
        return Color.Pink
    }
  }

}