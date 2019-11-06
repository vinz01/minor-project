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

  ngOnInit() {
    this.http.post('  PUT THE URL HERE !!!!   ', {
      method: 'POST',
      body: JSON.stringify({
        uid : 'images/test.png'
      })
    }).subscribe(data => {
      this.assets = data
      console.log(this.assets);
    });
  }

}
