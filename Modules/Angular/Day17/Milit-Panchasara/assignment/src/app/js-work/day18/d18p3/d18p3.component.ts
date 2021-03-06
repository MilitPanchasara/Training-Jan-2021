import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-d18p3',
  templateUrl: './d18p3.component.html',
  styleUrls: ['./d18p3.component.css']
})
export class D18p3Component implements OnInit {

  constructor() { }

  ngOnInit(): void {
    this.loadScript('/assets/js/js-d18/p3-script1.js');
  }

  loadScript(src:any){
    var script = document.createElement("script");
    script.type = "text/javascript";
    document.getElementsByTagName("body")[0].appendChild(script);
    script.src = src;
  }

}
