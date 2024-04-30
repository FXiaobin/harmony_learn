
import http from '@ohos.net.http'
import Prompt from '@system.prompt'
import Logger from '../Logger/Logger'


export class HttpUtils {

  // GET请求
  static GET(url: string, params: object, callback: (error: Error, response: http.HttpResponse, result: string)=>void) {
    HttpUtils.request(url, params, http.RequestMethod.GET, {}, callback)
  }

  // POST请求
  static POST(url: string, params: object, callback: (error: Error, response: http.HttpResponse, result: string)=>void) {
    HttpUtils.request(url, params, http.RequestMethod.POST, {}, callback)
  }

  // DELETE请求
  static DELETE(url: string, params: object, callback: (error: Error, response: http.HttpResponse, result: string)=>void) {
    HttpUtils.request(url, params, http.RequestMethod.DELETE, {}, callback)
  }

  // PUT请求
  static PUT(url: string, params: object, callback: (error: Error, response: http.HttpResponse, result: string)=>void) {
    HttpUtils.request(url, params, http.RequestMethod.PUT, {}, callback)
  }

  // 公共请求
  static request(url: string, params: object, method: http.RequestMethod, header: object, callback: (error: Error, response: http.HttpResponse, result: string)=>void) {
    let httpRequest = http.createHttp()
    httpRequest.request(url, {
      method: method ?? http.RequestMethod.GET,
      readTimeout: 60000,
      connectTimeout: 60000,
      header: {
        'Token': 'BasicAuth ',
        'Authorization': 'BasicAuth ',
        'Content-Type': 'application/json',
        // !!! 模拟客户端请求，否则返回的数据时HTML而不是JSON
        'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36',
        ...header
      },
      extraData: params ?? {}

    }, (err, data) => {
      Logger.info('===== 【HttpUtils request】: url = ', url)
      Logger.info('===== 【HttpUtils request】: responseCode = ', data.responseCode.toString())
      // Logger.info('===== 【HttpUtils request】: header = ', JSON.stringify(data.header))
      if (!err) {
        if (data.responseCode == 200) {
          let result = `${data.result}`
          Logger.info('===== 【HttpUtils request】: result = ', result)

          if (callback) {
            callback(err, data, result)
          }

        }else{
          if (callback) {
            callback(err, data, '')
          }

          // Prompt.showToast({
          //   message: '请求错误'
          // })
        }

      }else{
        Logger.info('===== 【HttpUtils request】: error = ', JSON.stringify(err))
        httpRequest.destroy()
        if (callback) {
          callback(err, data, '')
        }

      }
    })
  }





}