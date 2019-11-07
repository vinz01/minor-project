import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-assets-table',
  templateUrl: './assets-table.component.html',
  styleUrls: ['./assets-table.component.css']
})
export class AssetsTableComponent implements OnInit {

  constructor(private http: HttpClient) { }
  assets: any = []
  public count = 0;
  ngOnInit() {
    
  }
  send_post(){
    this.count = this.count +1;
    this.http.post('http://127.0.0.1:5101/', {
      url : 'images/test.png'   
    }).subscribe(data => {
      this.assets.push(data);
      console.log(this.assets);
    });
  }

}
