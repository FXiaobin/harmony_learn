export class NewsItemModel {
  cid: string;
  sourceId: string;
  source: string;
  title: string;
  mtime: string;
  imgsrc: string;
  votecount: string;
  url_3w: string;
  url: string;
}

export class NewsVideoItemModel {
  vid: string;
  category: string;
  title: string;
  ptime: string;
  cover: string;
  firstFrameImg: string;
  fullSizeImg: string;
  downTimes: string;
  mp4_url: string;
  m3u8_url: string;
  videoRatio: number;
}