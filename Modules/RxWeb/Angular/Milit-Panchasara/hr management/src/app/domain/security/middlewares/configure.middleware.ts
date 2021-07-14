import { Injectable } from "@angular/core";
import { IMiddleware } from "@rxweb/angular-router";
import { Router, ActivatedRouteSnapshot } from "@angular/router";
import { HttpClient } from "@angular/common/http";

export var configurationData: any;
@Injectable({
  providedIn: "root"
})
export class ConfigurationResolver implements IMiddleware {
  constructor(private http: HttpClient, private router: Router) {
      console.log("ConfigurationResolver called");
      
  }
  invoke(user: { [key: string]: any }) {
    const promise = new Promise<any>((resolve, reject) => {
      if (configurationData == undefined || configurationData == null)
        this.http.get(`/assets/configuration.json`).subscribe(response => {
          resolve(true);
          configurationData = response;
        });
      else resolve(true);
    });
    return promise;
  }
}