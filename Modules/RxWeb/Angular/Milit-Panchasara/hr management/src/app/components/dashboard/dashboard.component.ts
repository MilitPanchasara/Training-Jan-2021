import { OnInit } from "@angular/core";
import { Component } from "@angular/core";
import { List } from "@rxweb/generics";
import { DynamicFormBuildConfig, DynamicFormConfiguration, FormControlConfig, Hooks, RxDynamicFormBuilder } from "@rxweb/reactive-dynamic-forms";
import { translate } from "@rxweb/translate";
import { SkillAddComponent } from "../authentication/register/skill-add/skill-add.component";
import { FakeUser, User } from "../user/user.model";
import { SourceAsyncConditionalModel } from "./source";

export class QuantityModel extends FormControlConfig {

    hooks: Hooks = {      
          preValue: (v) => {
              return !isNaN(v);
          }
    }
}

export class UserModel extends FormControlConfig {

    private _class: string[];

    get class() {
        if (this.controlsConfig.name.value) {
            return ["form-control-lg"]
        }
        else {
            return ["form-control-sm"]
        }
    }

    set class(value: string[]) {
        this._class = value;
    }

    private _disabled: boolean;

    get disabled() {
        if (this.controlsConfig.name.value) {
            return false
        }
        else {
            return true
        }
    }

    set disabled(value: boolean) {
        this._disabled = value;
    }
}

@Component({
    selector: 'app-dashboard',
    templateUrl: './dashboard.component.html'
})
export class DashboardComponent implements OnInit{
    @translate({translationName:'dashboard'}) dashboard : any;
    items: List<FakeUser> = new List<FakeUser>([{ name: 'John', email:'john@j.j' }]);
    result:number;
    result2:number;
    addSkill: any = SkillAddComponent;
    
    serverData: Array<{ [key: string]: any }> = [
        {
            name:"name",
            type:"text",
            value: "John",
            ui: {
                "class":["form-control-lg"]
            },
            validators:{"contains":{"value":"@gmail.com",message:"INVALID EMAIL"},"required":{message:"EMAIL IS REQUIRED"}}
        },
        {
            name: "confirm",
            type: "checkbox",
            source: [{ value: 1, text: "I accept the terms and conditions" }]
        },
        {
            name: "skills",
            type: "checkbox",
            multiselect: true,
            source: [{ value: 1, text: "Angular" },{ value: 2, text: "MVC" },{ value: 3, text: "SQL Server" }],
            ui: {
                label: 'Skills'
            }
        },
        {
            name: "colorPicker",
            type: "color",
            ui: {
                label: 'Color Picker'
            }
        },
        // {
        //     name: "gender",
        //     type: "select",
        //     source: [{ value: 1, text: "Male" },{ value: 2, text: "Female" }],
        //     ui: {
        //         label: 'Gender',
        //         placeholder: 'Select',
        //     }
        // },
        {
            name: "country", 
            type: "select", 
            source: [{ text: "India", value: 1 }, { text: "US", value: 2 }, { text: "Canada", value: 3 }], 
            ui: {
              label: 'Country',
              placeholder: 'select'
            }
        },
        {
            name: "state", 
            modelName: 'sourceSync', 
            type: "select", 
            filter: [{ text: "Gujarat", value: 1, countryId: 1 }, { text: "Delhi", value: 2, countryId: 1 }, { text: "NY", value: 3, countryId: 2 }], 
            ui: {
                label: 'State',
                placeholder: 'select'
            }
        },
        {
            name: "profilePhoto",
            type: "file",
            ui: {
                label: 'Profile Photo'
            }
        },
        {
            name: "password",
            type: "password",
            ui: {
                label: 'Password'
            }
        },
        {
            name: "gender",
             type: "radio",
             source: [{ genderId: 1, genderName: "Male"},{ genderId: 2, genderName: "Female" }],
             textPropName: 'genderName',
             valuePropName: 'genderId',
             ui: {
                label: 'Gender'
            }
        },
        {
            name: 'bio',
            type: 'text',
            ui: {
                placeholder: "Enter bio"
            },
            modelName: 'userModel'
        },
        {
            name: 'address.number',
            type: 'text',
            ui: {
                label: 'House No.'
            }
        },
        {
            name: 'address.colony',
            type: 'text',
            ui: {
                label: 'Colony Name'
            }
        },
        {
            type:"text",
            name:"newPassword",
            ui:{
                "label":"New Password"
            },
            validators:{
                password:{
                    validation:{
                        maxLength: 10,
                        minLength: 5,
                        digit: true,
                        specialCharacter: true
                    },
                    messsage:"Invalid format."
                }
            }
        },
        {
            type:"text",
            name:"oldPassword",
            ui:{
                "description":"Shows Custom Validation Message",
                "label":"Old Password"
            },
            validators:{
                password:{
                    validation:{
                        maxLength: 10,
                        minLength: 5,
                        digit: true,
                        specialCharacter: true
                    },
                    message:"Password is not valid"
                }
            }
        },
        {
            type:"text",
            name:"confirmPassword",
            ui:{
                "description":"Shows Custom Validation Message using message key",
                "label":"Confirm Password"
            },
            validators:{
                password:{
                    validation:{
                        maxLength: 10,
                        minLength: 5,
                        digit: true,
                        specialCharacter: true
                    },
                    messageKey:"passwordMessageKey"
                }
            }
        },
        {
            name: 'quantity',
            type: 'text',
            ui: {
              label: 'Enter Quantity'
            },
            modelName: 'quantityModel'
          }
    ];

    uiBindings:string[] = ["name","bio","confirm","password","skills","colorPicker",
                            "gender","country", "state","profilePhoto","address.number",
                            "address.colony","newPassword","oldPassword","confirmPassword",
                            "quantity"];
    
    dynamicFormBuildConfig: DynamicFormBuildConfig;
    dynamicFormConfiguration: DynamicFormConfiguration;

    constructor(private formBuilder: RxDynamicFormBuilder) { }
    
    ngOnInit(){
        this.items.add({name:"Bharat", email:"bharat@b.b"});
        this.items.addRange([{name:"Milit", email:"milit@m.m"},{name:"Nirav", email:"n@n.n"}]);
        let marks = new List<{grade:number}>([{grade:90},{grade:56},{grade:89},{grade:75}]);
        console.log();
        // this.result = marks.average(x => x.grade);
        // this.result2 = marks.sum(x => x.grade);
        console.log(this.items.last());
        this.items.pop();
        console.log(this.items);
        console.log(this.items.count());

        this.dynamicFormConfiguration = {
            controlConfigModels: [
                { modelName: 'sourceAsync', model: SourceAsyncConditionalModel },
                {modelName:'userModel', model:UserModel },
                {modelName: "quantityModel", model: QuantityModel}
            ],
            additionalConfig: [
                {
                  type: 'card',
                  name: 'addressSection',
                  childrens: [
                    {
                      type: 'card-header',
                      props:
                      {
                        text: 'Address'
                      }
                    },
                    {
                      type: 'card-body',
                      childrens: ['address.number','address.colony']
                    }
                  ],
                  skipDefaultView: true
                }]
        }
        
        // this.dynamicFormBuildConfig = this.formBuilder.formGroup(this.serverData,this.dynamicFormConfiguration);
        this.dynamicFormBuildConfig = this.formBuilder.formGroup(this.serverData, this.dynamicFormConfiguration);
    }

    submitForm() {
        console.log(this.dynamicFormBuildConfig);
    }
}

