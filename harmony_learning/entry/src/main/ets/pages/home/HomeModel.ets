
export enum MovieListType {
  MovieListOnline,
  MovieListComing
}


export class MoviesOnlineResponseResult {

  movieList: Array<MoviesOnlineItem>;
  coming: Array<MoviesOnlineItem>;
  total: number;

  constructor() {
    this.movieList = [];
    this.coming = [];
    this.total = 0;
  }

}

export class MoviesOnlineItem {

  id: number;
  img: string;
  nm: string;
  sc: number;
  wish: number;
  star: string;
  rt: string;
  showInfo: string;
  comingTitle: string;

  // 详情相关字段
  dra: string;
  dur: number;
  fra: string;
  oriLang: string;
  photos: string[];
  pubDesc: string;
  shareInfo: object;
  shortComment: object;
  src: string;
  vd: string;
  videoImg: string;
  videoName: string;
  videourl: string;

}

export class MoviesDetailItem {

  id: number;
  img: string;
  nm: string;
  sc: number;
  wish: number;
  star: string;
  rt: string;
  showInfo: string;
  comingTitle: string;

  dra: string;
  dur: number;
  fra: string;
  oriLang: string;
  photos: string[];
  pubDesc: string;
  shareInfo: object;
  shortComment: object;
  src: string;
  vd: string;
  videoImg: string;
  videoName: string;
  videourl: string;

}