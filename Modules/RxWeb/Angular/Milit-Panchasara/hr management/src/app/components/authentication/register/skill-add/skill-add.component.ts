import { Component, OnInit } from '@angular/core';
import { RxDynamicFormBuilder } from '@rxweb/reactive-dynamic-forms';
import { DashboardComponent } from 'src/app/components/dashboard/dashboard.component';
import { RegisterComponent } from '../register.component';

@Component({
  selector: 'app-skill-add',
  templateUrl: './skill-add.component.html',
  styleUrls: ['./skill-add.component.css']
})
export class SkillAddComponent implements OnInit {

  //  constructor(private formBuilder2: RxDynamicFormBuilder) {
  //     super(formBuilder2);
  // }

  ngOnInit(): void {
  }

}
