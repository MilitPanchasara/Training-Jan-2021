import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { RegisterRoutingModule } from './register-routing.module';
import { RegisterComponent } from './register.component';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { RxRoutingModule } from '@rxweb/angular-router';
import { RxReactiveFormsModule } from '@rxweb/reactive-form-validators';
import { SkillAddComponent } from './skill-add/skill-add.component';


@NgModule({
  declarations: [RegisterComponent, SkillAddComponent],
  imports: [FormsModule, ReactiveFormsModule, RxReactiveFormsModule,
    RegisterRoutingModule, RxRoutingModule, CommonModule
],
})
export class RegisterModule { 
}
