/*라이브러리 모음*/

function isEmpty(input) {
   return !input.value;
}


// <input>랑 글자 수를 넣으면
// 그 글자 수보다 적으면 true, 아니면 false
function lessThan(input, length) {

   return input.value.length < length;

}

function overThan(input, length){
	return input.value.length > length;
}

// <input>을 넣으면
function notContainKey(input) {
   let ok = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890!@#$%^&*";
   for(let i = 0; i < input.value.length; i++){
      if(ok.indexOf(input.value[i]) == -1){
         return true;
      }
   }
}

/*function notContainKey2(input) {
   let ok = "1234567890!@#$%^&*";
   for(let i = 0; i < input.value.length; i++){
      if(ok.indexOf(input.value[i]) == -1){
         return true;
      }
   }
}*/

function notGoodId(input) {
   let ok = "ㅂㅈㄷㄱㅅㅛㅕㅑㅐㅔㅁㄴㅇㄹㅎㅗㅓㅏㅣㅋㅌㅊㅍㅠㅜㅡㅄㄻ";
   for(let i = 0; i < input.value.length; i++){
      if(ok.indexOf(input.value[i]) != -1){
         return true;
      }
   }
}




///////////////////////////////////////////////////


function notCorrectAddr(input) {

   let ok = "!@#$%^&*+=`~/?[]{}<>,.";

   for(let i = 0; i < input.value.length; i++){
      
      if(ok.indexOf(input.value[i]) != -1){
         return true;
      }
      
   }
}

function notCorrectPhoneNumber(input) {

   let ok = "- ";

   for(let i = 0; i < input.value.length; i++){
      
      if(ok.indexOf(input.value[i]) != -1){
         return true;
      }
      
   }
}

// Test

// <input> x 2 넣으면 (비밀번호 재확인에 쓸꺼)
// 내용이 다르면 true, 아니면 false
function notEquals(input1, input2){
    return input1.value != input2.value;
}


// <input>, 문자열 세트
// 그 문자열 세트가 포함 안되있으면 true
// 들어있으면 false
function notContains(input, set){
   // input : 1qwerASD
   
   // set : 1234567890      숫자를 반드시 포함시키고 싶다
   
   for(let i = 0; i < set.length; i++){
      
      if(input.value.indexOf(set[i]) != -1){
         return false;
      }
   }
   
   return true;
}


// <input>을 넣어서
// 숫자가 아니면 true, 숫자면 false
function isNotNumber(input){
   return isNaN(input.value);
}

function check4(input){
   if(input.value =='f'){
      return true;
   }
   else if(input.value =='t'){
      return false;
   }
}



