import { Component, OnInit } from '@angular/core';
import { FormArray, FormGroup } from '@angular/forms';
import { RxFormArray, RxFormBuilder, RxFormGroup } from '@rxweb/reactive-form-validators';
import { Address, User } from 'src/models/user.model';
import { UserService } from '../user.service';

@Component({
  selector: 'app-student-form',
  templateUrl: './student-form.component.html',
  styleUrls: ['./student-form.component.css']
})
export class StudentFormComponent implements OnInit {

  userFormGroup : FormGroup ;
  constructor(private formBuilder:RxFormBuilder,private service:UserService) { }

  ngOnInit(): void {
    let user = new User();
    user.addresses = new Array<Address>();
    let address = new Address();
    user.addresses.push(address);
    this.userFormGroup = this.formBuilder.formGroup(user);
    this.service.getData().subscribe(x => {
      console.log(x);
      this.service.data = x.data;
    });
  }

  get addresses() {
    return (<RxFormArray>this.userFormGroup.get('addresses')).controls;
  }

  getAddress(i) {
    return (<RxFormGroup>(<RxFormArray>this.userFormGroup.get('addresses')).controls[i]);
  }

  addAddress(){
    let addresses = this.userFormGroup.controls.addresses as FormArray;
    addresses.push(this.formBuilder.formGroup(Address));
  }
  
  submitForm() {
    console.log(this.userFormGroup);
  }

}
