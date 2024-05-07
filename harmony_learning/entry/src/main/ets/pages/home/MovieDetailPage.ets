import router from '@ohos.router'
import Prompt from '@system.prompt'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
import { HttpUtils } from '../../Utils/Http/HttpUtils'
import Logger from '../../Utils/Logger/Logger'
import { MoviesOnlineItem } from './HomeModel'
@Entry
@Component
export struct MovieDetailPage {

  scroller: Scroller = new Scroller();

  @State navTitle: string = '详情'
  private movieId: number

  @State detailMovie: MoviesOnlineItem = null

  aboutToAppear(){
    let title = router.getParams()['title']
    let id = router.getParams()['id']

    this.navTitle = title
    this.movieId = id

    Prompt.showToast({
      message: id + title
    })

    this.loadDetailData()

  }

  loadDetailData() {
    let url = 'https://m.maoyan.com/ajax/detailmovie?movieId=' + this.movieId
    HttpUtils.GET(url, {}, (error, response, result) => {
      // Logger.info('+++ ')
      let obj = JSON.parse(result)
      let detailMovie: MoviesOnlineItem = obj['detailMovie']
      this.detailMovie = detailMovie
    })
  }

  build() {

    Column() {
      // 自定义导航提
      CustomNavigationBar({
        showBack: true,
        title: this.navTitle,
        titleColor: Color.White,
        navBarColor: $r('app.color.color_primary'),
        statusBarColor: $r('app.color.color_primary'),
        leadingBuildParam: null,
        centerBuildParam: null,
        trailingBuildParam: null
      })

      Scroll(this.scroller){
        Column(){
          if (this.detailMovie != null) {

            this.movieInfo()

            this.moviePhotos()

            this.movieIntroduce()
          }
        }
        .width('100%')
        // .backgroundColor(Color.Gray)
      }
      .layoutWeight(1)
      // .backgroundColor(Color.Red)
      .scrollable(ScrollDirection.Vertical) // 滚动方向为垂直方向
      .scrollBar(BarState.Auto) // 滚动条常驻显示
      .scrollBarColor(Color.Gray) // 滚动条颜色
      .scrollBarWidth(1) // 滚动条宽度
      .edgeEffect(EdgeEffect.Spring)



      // Text('测试 底部 视图').width('100%').height(50).backgroundColor(Color.Orange)

    }
    .width('100%')
    .height('100%')
    // .backgroundColor(Color.Pink)
  }

  @Builder movieInfo() {
    Row(){
      Image(this.detailMovie.img ?? $r('app.media.tab_skills_sel'))
        .width(120)
        .height(180)
        .margin({
          left: 15.0
        })
        .objectFit(ImageFit.Cover)
        .borderRadius(8.0)

      Column(){
        Text('电影名称：' + this.detailMovie.nm).fontSize(18).fontColor($r('app.color.color_2F343A'))
        Text('电影评分：' + this.detailMovie.sc).fontSize(16).fontColor($r('app.color.color_2F343A'))
        Text('上映日期：' + this.detailMovie.pubDesc).fontSize(16).fontColor($r('app.color.color_2F343A'))
        Text('主演：' + this.detailMovie.star).fontSize(16).fontColor($r('app.color.color_2F343A'))
          .maxLines(2)
          .textOverflow({
            overflow: TextOverflow.Ellipsis
          })
      }
      .height(180)
      .layoutWeight(1)
      .justifyContent(FlexAlign.SpaceBetween)
      .alignItems(HorizontalAlign.Start)
      // .backgroundColor(Color.Orange)
      .margin({
        left: 12.0,
        right: 12.0
      })
    }
    .height(220)
    .width('100%')
    // .backgroundColor(Color.Green)

  }

  @Builder
  moviePhotos() {
    Column(){
      Text('电影剧照').height(50.0).fontSize(20).fontWeight(FontWeight.Bold)

      Grid(){
        ForEach(this.detailMovie.photos, url => {

          GridItem(){
            Image(url)
              // .width(80)
              .height(100)
              // .aspectRatio(0.8)
              .objectFit(ImageFit.Cover)
              .borderRadius(5.0)
          }
          // .backgroundColor(Color.Blue)

        }, url => url)

      }
      .height(505)
      // .layoutWeight(1)
      // .backgroundColor(Color.Pink)
      .columnsTemplate('1fr 1fr 1fr 1fr')
      .layoutDirection(GridDirection.Row)
      // .maxCount(5)
      .columnsGap(1)
      .rowsGap(1)
      .margin({
        left: 12,
        right: 12,
        bottom: 12
      })

    }
    // .layoutWeight(1)
    .width('100%')
    // .height(400)
    // .backgroundColor(Color.Brown)

  }

  @Builder
  movieIntroduce() {

    Column(){
      Text('电影简介').height(50.0).fontSize(20).fontWeight(FontWeight.Bold)
      Text(this.detailMovie.dra)
        .fontColor($r('app.color.color_8D9299'))
        .fontSize(15)
        .margin({
          left: 12,
          right: 12,
          bottom: 12
        })
    }
    .width('100%')
    // .backgroundColor(Color.Yellow)

  }




}