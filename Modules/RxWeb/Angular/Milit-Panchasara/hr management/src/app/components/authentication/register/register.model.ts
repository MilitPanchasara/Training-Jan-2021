import { AbstractControl } from "@angular/forms";
import { alpha, blacklist,escape, disable, elementClass, email, ltrim, model, prefix, prop, propArray, required, sanitize } from "@rxweb/reactive-form-validators";

export class Address {
    @prop()
    city: string;
  
    @prop()
    country: string;
  }
  

//applies to whole model
@model([{
    propNames: [":all:"], validationConfig: { required: true } }])
export class registerUser {
    @prop()
    @sanitize({custom:(x)=> (x == '1K' ||  x == '1k') ? 1000  : x  })
    amount: string;
    // static modeType:string = 'View';

    @alpha({message:"Only alphabets are allowed."})
    @required({message:"Name is required."})
    @elementClass({
      conditionalExpression: function (c) {
          return this.password == this.name && c.dirty == true ? 'ng-invalid' : '';
      }})
    @blacklist('1234567890') 
    @ltrim() 
    @prefix('Dr. ' )
    @escape() 
    name:string='';

    @prop()
    modeType:string;
    
    // @required({message:"Password is required."})
    // @disable({conditionalExpression:function(control:AbstractControl){console.log(registerUser.modeType);return registerUser.modeType == 'View' }})
    @disable({conditionalExpression:function(control:AbstractControl){return this.modeType == "View"; }})
    @prop()
    password:string='Milit';
    
    @email()
    @required({message:"Email is required."})
    email:string='abc@gmail.com';

    @propArray(Address)
  addresses: Address[]=[];
}