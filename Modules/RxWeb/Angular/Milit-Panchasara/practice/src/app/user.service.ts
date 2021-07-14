import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private httpClient:HttpClient) { }

  data = [];

  getData() {
    var header =  new HttpHeaders({
      'app-id':'lTE5abbDxdjGplutvTuc'
    });
    return this.httpClient.get<any>('https://dummyapi.io/data/api/user?limit=10',{headers:header});
  }
}
