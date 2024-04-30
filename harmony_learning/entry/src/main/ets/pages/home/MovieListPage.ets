import Prompt from '@system.prompt';
import http from '@ohos.net.http';
import Logger from '../../Utils/Logger/Logger';
import { MovieListType, MoviesOnlineItem, MoviesOnlineResponseResult } from './HomeModel';


@Component
export struct MovieListPage {

  private type: MovieListType = MovieListType.MovieListOnline

  @State movieList: MoviesOnlineItem[] = [];


  aboutToAppear(){

    this.loadMovieListData()
  }

  build(){
    Column(){
      // Text('HomePage')

      if (this.movieList && this.movieList.length > 0) {
        List(){
          ForEach(this.movieList, (item: MoviesOnlineItem, index: number)=>{

            ListItem(){
              Column(){
                Row(){
                  Image(item.img)
                    .width(120)
                    .height(180)
                    .objectFit(ImageFit.Cover)
                    .backgroundColor(Color.Gray)
                    .borderRadius(6)
                    .margin({
                      left: 12.0
                    })

                  Column(){
                    Text('电影名称：' + item.nm).fontSize(18).fontColor($r('app.color.color_2F343A'))
                    Text('电影评分：' + item.sc).fontSize(16).fontColor($r('app.color.color_2F343A'))
                    Text('上映日期：' + item.comingTitle).fontSize(16).fontColor($r('app.color.color_2F343A'))
                    Text('主演：' + item.star).fontSize(16).fontColor($r('app.color.color_2F343A'))
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
                .width('100%')
                .height(220)
                .backgroundColor(Color.White)

                Divider()
                  .color($r('app.color.color_divider'))
                  .height(1)
                  .margin({
                    left: 12.0
                  })
              }
              // .width('100%')
              // .margin(15.0)

            }

          }, (item) => item.id+'')

        }
        .width('100%')
        .height('100%')
        // .backgroundColor(Color.Pink)
      }


    }
    .width('100%')
    .height('100%')
    // .layoutWeight(1)
    .backgroundColor($r('app.color.color_pageBackground'))


  }


  loadMovieListData() {
    let url = 'https://m.maoyan.com/ajax/movieOnInfoList'
    if (this.type == MovieListType.MovieListComing) {
      url = 'https://m.maoyan.com/ajax/comingList?ci=10&token=&limit=10'
    }
    let httpRequest = http.createHttp()
    httpRequest.request(url, {
      method: http.RequestMethod.GET,
      readTimeout: 60000,
      connectTimeout: 60000,
      header: {
        'Content-Type': 'application/json',
        // !!! 模拟客户端请求，否则返回的数据时HTML而不是JSON
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36'
      },
      extraData: {}

    }, (err, data) => {

      if (!err) {
        if (data.responseCode == 200) {
          let result = `${data.result}`
          Logger.info('===== api 222===== result = ', result)
          let response: MoviesOnlineResponseResult = JSON.parse(result)
          if (this.type == MovieListType.MovieListComing) {
            this.movieList = response.coming
          }else{
            this.movieList = response.movieList
          }


        }else{
          Prompt.showToast({
            message: '请求错误'
          })
        }

      }else{
        httpRequest.destroy()
      }
    })
  }





}