import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-d15p1',
  templateUrl: './d15p1.component.html',
  styleUrls: ['./d15p1.component.css']
})
export class D15p1Component implements OnInit {

  constructor() { }
  ngOnInit(): void {
    this.loadScript('/assets/js/js-d15/p1-script1.js');
  }

  loadScript(src:any){
    var script = document.createElement("script");
    script.type = "text/javascript";
    document.getElementsByTagName("body")[0].appendChild(script);
    script.src = src;
  }

}
