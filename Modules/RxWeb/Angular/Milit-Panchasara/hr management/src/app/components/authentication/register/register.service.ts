import { Injectable } from '@angular/core';
import { http, RxHttp } from '@rxweb/http';

@http({
  path:'assets/json'
})

@Injectable({
  providedIn: 'root'
})
export class RegisterService extends RxHttp{

  constructor(

  ){super();}
}
