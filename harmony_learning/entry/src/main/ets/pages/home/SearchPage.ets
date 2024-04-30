import Prompt from '@system.prompt'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
@Entry
@Component
export struct SearchPage {

  @Builder empty() {
    Row()
  }

  build(){

    Column(){

      CustomNavigationBar({
        navBarColor: $r('app.color.color_primary'),
        statusBarColor: $r('app.color.color_primary'),
        leadingBuildParam: null,
        centerBuildParam: null,
        trailingBuildParam: null,
        showBack: true,
        showSearch: true,
        placeholder: '请输入电影名称',
        onSearchClick: (searchText) => {
          if (searchText.length == 0) {
            Prompt.showToast({
              message: '请输入要搜索的电影名称'
            })
            return
          }
          Prompt.showToast({
            message: searchText
          })
        }
      })

    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Orange)
  }
}