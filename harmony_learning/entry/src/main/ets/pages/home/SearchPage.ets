import Prompt from '@system.prompt'
import { CustomNavigationBar } from '../../common/CustomNavigationBar/CustomNavigationBar'
@Entry
@Component
export struct SearchPage {

  build(){

    Column(){

      CustomNavigationBar({
        showBack: true,
        showSearch: true,
        placeholder: '请输入电影名称',
        onSearchClick: (searchText) => {
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