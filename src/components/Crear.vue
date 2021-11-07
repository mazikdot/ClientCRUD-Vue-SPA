<template>
    <div class="container">
        <div class="card">
            <div class="card-header">
                Add data
            </div>
            <div class="card-body">
                <form>
                    <div class="form-group">
                    <select @click="fetchPrefix()" v-model="select_prefix">
                <option style="width:20px;" value="">เลือกคำนำหน้า</option>
                    <option :key="data.prefix_id" v-for="data in prefix_test" :value="data.prefix_id" >{{data.pre_th_name}}</option>
                    </select>
                    </div>
                    <div class="input-field col s12">
                              <!-- <label for="user_username">Username</label> -->
                              <input name="user_username" type="text" id="user_username" v-model="user_username" autocomplete="off" required placeholder="กรอกบัญชีผู้ใช้">
                            </div>

                            <div class="input-field col s12">
                              <!-- <label for="user_passwords">Password</label> -->
                              <input id="user_password" name="user_password" type="password" v-model="user_password" autocomplete="off" required placeholder="กรอกพาสเวิร์ด">
                            </div>
                            <div class="input-field col s12">
                              <!-- <label for="user_passwords">Password</label> -->
                              <input id="user_firstname" name="user_firstname" type="text" v-model="user_firstname" autocomplete="off" required placeholder="ชื่อ">
                            </div>
                            <div class="input-field col s12">
                              <!-- <label for="user_passwords">Password</label> -->
                              <input id="user_lastname" name="user_lastname" type="text" v-model="user_lastname" autocomplete="off" required placeholder="นามสกุล">
                            </div>
                   
                </form>
                <button class="btn btn-primary" @click="submitData()">
                    เพิ่มข้อมูล
                </button>
            </div>
            
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    name : 'Crear',
      data() {
      return {
    
      prefix_data: '',
      sex_data: '',
      user_username: '',
      user_lastname: '',
      user_firstname: '',
    user_password : '',
      select_prefix: '',
      select_sex: '',
      prefix_test: []
      };
    },
    methods: {
            fetchPrefix : function(){
          axios.get("http://localhost:3000/Prefix").then((response) =>{
          this.prefix_test = []
          this.prefix_test = response.data.data;
      //    console.log(this.prefix_test);
          })
      },
     
      submitData() {
            axios.post("http://localhost:3000/InsertSpa", {
              user_username: this.user_username,
              user_password: this.user_password,
                prefix_id: this.select_prefix,
              user_firstname: this.user_firstname,
              user_lastname: this.user_lastname,
            //   user_email: this.user_email,
            //   user_phone: this.user_phone,
            //   sex_id: this.select_sex,
            //   prefix_id: this.select_prefix,
            //   province_id: this.select_province,
            //   districts_id: this.select_districts,
            //   amphure_id: this.select_amphures
            }).then(res=>{

                console.log(res)
            });
              
            //   else if (res.data.message == 'โปรดลองอีกครั้งบัญชีนี้มีผู้ใช้แล้ว') {
            //     swal(res.data.message, 'กรุณาลองอีกครั้ง', 'error').then(function() {
            //        this.$router.push('Login')
            //     });
            //   } else if (res.data.message == 'รหัสผ่านไม่น้อยกว่า 6 ตัวอักษร') {
            //     swal(res.data.message, 'กรุณาลองอีกครั้ง', 'warning').then(function() {});
            //   }
            //   else if (res.data.message == 'กรุณากรอกข้อมูลให้ครบถ้วน') {
            //     swal(res.data.message, 'กรุณาลองอีกครั้ง', 'warning').then(function() {});
            //   }
            //   else if (res.data.message == 'รหัสผ่านของท่านไม่ตรงกัน') {
            //     swal(res.data.message, 'กรุณาลองอีกครั้ง', 'warning').then(function() {});
            //   }
            
      }
    },
    created: function() {
    //   this.fetchProvince();
    }
}
</script>