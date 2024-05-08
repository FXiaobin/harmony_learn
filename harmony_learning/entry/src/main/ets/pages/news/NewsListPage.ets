
import router from '@ohos.router'
import { HttpUtils } from '../../Utils/Http/HttpUtils'
import { NewsItemModel, NewsVideoItemModel } from './NewsModel'
@Component
export struct NewsListPage {

  private typeNum: number
  @State dataList: NewsItemModel[] = []
  @State videoList: NewsVideoItemModel[] = []

  aboutToAppear(){
    this.loadNewsData()
  }

  build(){
    Column(){
      // Text('news list page - ' + this.typeNum)

      if (this.dataList.length > 0) {
        this.newsListUI()
      }else if (this.videoList.length > 0) {
        this.videoListUI()
      }

    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.color_pageBackground'))
    // .backgroundColor(this.colorWith(this.typeNum))
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


  @Builder videoListUI(){
    List(){
      ForEach(this.videoList, (item: NewsVideoItemModel, index)=> {
        ListItem(){
          Column(){
            Image(item.cover)
              .width('100%')
              .height(180)
              .borderRadius(6.0)
              .objectFit(ImageFit.Cover)
              .backgroundColor($r('app.color.color_divider'))
              .alt($r('app.media.image_placeholder'))

            Column(){
              Text(item.title)
                .width('100%')
                .fontSize(16)
                .fontColor($r('app.color.color_2F343A'))
                .maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
                .margin({
                  bottom: 10.0
                })
              // .backgroundColor(Color.Green)


              Row(){
                Text('时间：' + item.ptime).fontSize(12).fontColor($r('app.color.color_8D9299'))
                Text('下载次数：' + item.downTimes).fontSize(12).fontColor($r('app.color.color_8D9299'))
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              // .backgroundColor(Color.Pink)
            }
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(HorizontalAlign.Start)
            .margin({
              top: 10,
            })
            // .backgroundColor(Color.Orange)
          }
          .backgroundColor(Color.White)
          .width('100%')
          .padding(12.0)
          .border({
            width: 0.5,
            color: $r('app.color.color_divider'),
            style: {
              bottom: BorderStyle.Solid
            }
          })
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/news/NewsVideoPage',
              params: {
                item: item
              }
            })
          })
        }
      }, item => item.cid)
    }

  }

  @Builder newsListUI(){
    List(){
      ForEach(this.dataList, (item: NewsItemModel, index)=> {
        ListItem(){
          Row(){
            Image(item.imgsrc)
              .width(100)
              .height(80)
              .borderRadius(6.0)
              .objectFit(ImageFit.Cover)
              .backgroundColor($r('app.color.color_divider'))
              .alt($r('app.media.image_placeholder'))

            Column(){
              Text(item.title)
                .width('100%')
                .fontSize(16)
                .fontColor($r('app.color.color_2F343A'))
                .maxLines(2)
                .textOverflow({overflow: TextOverflow.Ellipsis})
              // .backgroundColor(Color.Green)


              Row(){
                Text('时间：' + item.mtime).fontSize(12).fontColor($r('app.color.color_8D9299'))
                Text('浏览次数：' + item.votecount).fontSize(12).fontColor($r('app.color.color_8D9299'))
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              // .backgroundColor(Color.Pink)
            }
            .height(80)
            .layoutWeight(1)
            .justifyContent(FlexAlign.SpaceBetween)
            .alignItems(HorizontalAlign.Start)
            .margin({
              left: 10
            })
            // .backgroundColor(Color.Orange)
          }
          .backgroundColor(Color.White)
          .width('100%')
          .padding(12.0)
          .border({
            width: 0.5,
            color: $r('app.color.color_divider'),
            style: {
              bottom: BorderStyle.Solid
            }
          })
          .onClick(()=>{
            router.pushUrl({
              url: 'pages/news/NewsDetailPage',
              params: {
                item: item
              }
            })
          })
        }
      }, item => item.cid)
    }

  }




  loadNewsData() {
    let url = 'https://c.m.163.com/nc/auto/list/6YOR5bee/0-20.html'
    if (this.typeNum == 2) {
      // 视频
      url = 'https://c.m.163.com/recommend/getChanListNews?channel=T1457068979049&size=20'
    }
    HttpUtils.GET(url, {}, (err, response, result) => {
      if (response.responseCode == 200) {
        let obj = JSON.parse(result)
        if (this.typeNum == 2) {
          this.videoList = obj['视频']

        }else {
          this.dataList = obj['list']
        }
      }
    })
  }

}