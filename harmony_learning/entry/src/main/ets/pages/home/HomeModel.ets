
export class MoviesOnlineResponseResult {

  movieList: Array<MoviesOnlineItem>;
  total: number;

  constructor() {
    this.movieList = [];
    this.total = 0
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

}