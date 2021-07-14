import { Component, OnInit } from '@angular/core';
import { FormGroup,FormArray, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { middleware } from '@rxweb/angular-router';
import { ReactiveFormConfig, required, RxFormBuilder, RxFormGroup, RxwebValidators } from '@rxweb/reactive-form-validators';
import { RxTranslation, translate, TranslationCore } from '@rxweb/translate';
import { LoggedInMiddleware } from 'src/app/domain/security/middlewares/loggin.middleware';
import { BrowserStorage } from 'src/app/domain/services/browser-storage';
import { User } from '../../user/user.model';
import { Address, registerUser } from './register.model';
import { IFormBuilder,IFormGroup } from '@rxweb/types';
// import { } from './register.model';
import { RegisterService } from './register.service';
export class UserInfo {

	@required() 
	firstName: string;
	
	
}

@middleware([LoggedInMiddleware])
@Component({
  selector: 'app-register',
  templateUrl: './register.component.html'
})
export class RegisterComponent implements OnInit {
  regFormGroup: FormGroup;
  @translate({translationName:'registerUser'}) registerUser : any;
  @translate() global : {[key:string]:any}
    regModel:registerUser;
    selectedLanguage:string = 'EN';
    currentMode: string = "View";

    userDetailsFormGroup: RxFormGroup;
    
    form2Group:IFormGroup<User>;
    form2Builder:IFormBuilder;

  constructor(private formBuilder: RxFormBuilder, form2Builder:FormBuilder, private router: Router, private storageHelper: BrowserStorage,private rxTranslation: RxTranslation) { 
    this.regModel = new registerUser();
    let address = new Address(); 
    this.regModel.addresses.push(address);
    this.form2Builder = form2Builder;

    ReactiveFormConfig.i18n = {
        validationMessage: () => {
                    return TranslationCore.getText("global.validationMessages")
        }
    };
    Object.defineProperty(ReactiveFormConfig.i18n, "language", {
        get: () => {
          
            return this.rxTranslation.language;
        }
    })

  }

  changeLanguage2(languageCode) {
    this.rxTranslation.change(languageCode);
  }

  userInfoFormGroup: FormGroup
  showComponent:boolean;

  get day() {
    var currentHour = (new Date()).getHours();
    return currentHour < 12 ? 'Good Morning' : 'Good Day';
  }
  
  title = 'getting-started';


  ngOnInit(): void {
    
    setTimeout(()=>{
      this.showComponent = true;    
      let userInfo = new UserInfo();
      this.userInfoFormGroup = this.formBuilder.formGroup(userInfo);
    },500);

    this.userDetailsFormGroup = <RxFormGroup>this.formBuilder.group({
      firstName: [''],
      lastName: [''],
      email: ['', RxwebValidators.compose({ validators: [] })],
      profilePhoto: ['', RxwebValidators.image({ maxHeight: 100, maxWidth: 100 })],
      isPermanentAddress: [''],
      address: this.formBuilder.group({
        cityName: [''],
        areaName: ['']
      })
    });
    
    let user = new User();
    this.regModel.modeType = this.currentMode;
    this.regFormGroup = this.formBuilder.formGroup(this.regModel);
    this.form2Group = this.form2Builder.group<User>(user);
    
    // will show error due to strong type
    // this.form2Group.controls.fakeControl;
  }

  submitUser() {
    // toFormData() method converts the json object to Form Data when hits the server API
    let userDetailsValue = this.userDetailsFormGroup.toFormData();
    console.log(userDetailsValue);
    
  }

  submitForm() {
    console.log(this.regFormGroup);
    let x = this.regFormGroup;
    // this.storageHelper.local.save('auth', 'response_token', false);
    // this.storageHelper.local.save('key', 'response_key', false);
    // this.router.navigate(['/dashboard']);
  }

  changeMode() {
    this.currentMode = this.currentMode == "View" ? "Edit" : "View";
    this.regFormGroup.controls.modeType.setValue(this.currentMode);
  }
  // changeMode() {
  //   // this.regFormGroup.controls.password.validator()
  //   this.currentMode = this.currentMode == "View" ? "Edit" : "View";
  //   registerUser.modeType = this.currentMode;
  //   // this.regFormGroup.controls.modeType.setValue(this.currentMode);
  // }

  changeLanguage(languageCode: any) {
    this.selectedLanguage = languageCode.toUpperCase();
    this.rxTranslation.change(languageCode);
  }

  addAddress(){
      let addresses = this.regFormGroup.controls.addresses as FormArray;
      addresses.push(this.formBuilder.formGroup(Address));
    }

  getAddresses() {
    return (this.regFormGroup.controls.addresses as FormArray).controls;
  }

  getAddress(i) {
    return (this.regFormGroup.controls.addresses as FormArray)[i] as FormGroup; 
  }
}
