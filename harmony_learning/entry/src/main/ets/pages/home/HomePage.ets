
import router from '@ohos.router'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
import { MovieListType } from './HomeModel'
import { MovieListPage } from './MovieListPage'


@Entry
@Component
export struct HomePage {


  private  tabsController: TabsController = new TabsController()
  @State currentIndex: number = 0

  @Builder TabBarItemBuilder(title: string, targetIndex: number, normalImg: Resource, selectedImg: Resource) {
    Column({space: 3}) {
      Image(this.currentIndex === targetIndex ? selectedImg : normalImg)
        .size({ width: 24, height: 24 })
      Text(title)
        .fontSize(12)
        .fontColor(this.currentIndex === targetIndex ? $r('app.color.color_white') : $r('app.color.color_B1B8C1'))
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    // .backgroundColor(Color.Pink)
    .onClick(() => {
      this.currentIndex = targetIndex;
      this.tabsController.changeIndex(this.currentIndex);
    })

  }


  // 自定义右侧搜索按钮
  @Builder navigationRight() {
    Button(){
      Image($r('app.media.search_white')).width(20).height(20).fillColor(Color.White)
    }
    .width(44)
    .height(44)
    .margin({right: 2.0})
    .backgroundColor(Color.Transparent)
    .onClick(()=>{
      router.pushUrl({
          url: 'pages/home/SearchPage'
      })
    })
  }

  build() {

    Column() {
      // 自定义导航提
      CustomNavigationBar({
        title: '首页',
        // titleAlign: FlexAlign.Start,
        // leading: 0,
        titleColor: Color.White,
        navBarColor: $r('app.color.color_primary'),
        statusBarColor: $r('app.color.color_primary'),
        leadingBuildParam: null,
        centerBuildParam: null,
        trailingBuildParam: this.navigationRight
      })

      Tabs({ barPosition: BarPosition.Start, controller: this.tabsController }) {

        TabContent(){
          MovieListPage({
            type: MovieListType.MovieListOnline
          })
        }
        .tabBar(this.TabBarItemBuilder('正在热映', 0, $r('app.media.movie_online'), $r('app.media.movie_online_sel')))

        TabContent(){
          MovieListPage({
            type: MovieListType.MovieListComing
          })
        }
        .tabBar(this.TabBarItemBuilder('即将上映', 1, $r('app.media.movie_coming'), $r('app.media.movie_coming_sel')))

      }
      .width('100%')
      .layoutWeight(1)  // 自适应剩余空间
      .barMode(BarMode.Fixed)
      .barWidth('100%')
      .barHeight(50)
      // 禁用页面滚动
      .scrollable(false)
      // 禁用页面滚动动画
      // .animationDuration(0)
      .backgroundColor($r('app.color.color_primary'))
      .onChange((index: number) =>
        this.currentIndex = index
      )



    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.color_pageBackground'))
  }


}