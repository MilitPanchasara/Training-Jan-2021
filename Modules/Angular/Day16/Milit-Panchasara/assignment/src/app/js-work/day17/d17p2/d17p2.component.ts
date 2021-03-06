import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-d17p2',
  templateUrl: './d17p2.component.html',
  styleUrls: ['./d17p2.component.css']
})
export class D17p2Component implements OnInit {

  constructor() { }

  ngOnInit(): void {
    this.loadScript('/assets/js/js-d17/p2-script1.js');
  }

  loadScript(src:any){
    var script = document.createElement("script");
    script.type = "text/javascript";
    document.getElementsByTagName("body")[0].appendChild(script);
    script.src = src;
  }

}
