import { NewsListPage } from './NewsListPage'
@Entry
@Component
export struct NewsPage {

  private titles: string[] = ['推荐', '热点', '视频', '汽车', '运动', '科技', '音乐', '娱乐', '其他']
  private tabsController = new TabsController()
  @State currentIndex: number = 0

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

        Tabs({
          barPosition: BarPosition.Start,
          index: 0,
          controller: this.tabsController
        }) {
          // Text('NewsPage')

          ForEach(this.titles, (title, index) => {
            TabContent() {

              NewsListPage({
                typeNum: index
              })

            }
            .tabBar(this.tabTitle(title, index))

          }, item => item)

        }
        .barMode(BarMode.Scrollable)
        .width('100%')
        .height('100%')
        .backgroundColor(Color.White)
        .onChange((index)=>{
          this.currentIndex = index
          this.tabsController.changeIndex(index)
        })
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

  @Builder tabTitle(title: string, index) {
    Text(title)
      .fontColor(this.currentIndex == index ? $r('app.color.color_primary') : $r('app.color.color_2F343A'))
      .fontSize(this.currentIndex == index ? 18 : 16)
      .padding({
        left: 10,
        right: 10
      })
      .onClick(()=>{
        this.currentIndex = index
        this.tabsController.changeIndex(index)
      })
  }




}