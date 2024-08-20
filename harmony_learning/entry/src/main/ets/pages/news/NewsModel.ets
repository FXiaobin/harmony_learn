export class NewsItemModel {

  constructor() {

  }

  public cid: string = '';
  public sourceId: string= '';
  public source: string = '';
  public title: string = '';
  public mtime: string = '';
  public imgsrc: string = '';
  public votecount: string = '';
  public url_3w: string = '';
  public url: string = '';
}

export class NewsVideoItemModel {
  constructor() {
  }

  vid: string = '';
  category: string = '';
  title: string = '';
  ptime: string = '';
  cover: string = '';
  firstFrameImg: string = '';
  fullSizeImg: string = '';
  downTimes: string = '';
  mp4_url: string = '';
  m3u8_url: string = '';
  videoRatio: number = 0;
}