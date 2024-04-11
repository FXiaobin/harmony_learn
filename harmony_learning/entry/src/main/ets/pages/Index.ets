
import { HomePage } from './home/HomePage'
import { MyPage } from './my/MyPage'
import { NewsPage } from './news/NewsPage'
import { SkillsPage } from './skills/SkillsPage'

@Entry
@Component
struct Index {

  private  tabsController: TabsController = new TabsController()
  @State currentIndex: number = 0

  @Builder TabBarItemBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column({space: 3}) {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 24, height: 24 })
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.color_primary') : $r('app.color.color_B1B8C1'))
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    // .backgroundColor(Color.Pink)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })

  }

  build() {
    Column() {

       Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent(){
          HomePage()
        }
        .tabBar(this.TabBarItemBuilder('首页', 0, $r('app.media.tab_home'), $r('app.media.tab_home_sel')))

        TabContent(){
          NewsPage()
        }
        .tabBar(this.TabBarItemBuilder('新闻', 1, $r('app.media.tab_news'), $r('app.media.tab_news_sel')))

        TabContent(){
          SkillsPage()
        }
        .tabBar(this.TabBarItemBuilder('功能', 2, $r('app.media.tab_skills'), $r('app.media.tab_skills_sel')))

        TabContent(){
          MyPage()
        }
        .tabBar(this.TabBarItemBuilder('我的', 3, $r('app.media.tab_my'), $r('app.media.tab_my_sel')))

      }
       .barMode(BarMode.Fixed)
       .barWidth('100%')
       .barHeight(50)
       // 禁用页面滚动
       .scrollable(false)
       // 禁用页面滚动动画
       .animationDuration(0)
       .backgroundColor($r('app.color.color_white'))
       .onChange((index: number) =>
         this.currentIndex = index
       )

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.color_pageBackground'))
    // .backgroundColor(Color.Green)
  }
}