<template>
   <div class="container">
       <div>
           Editar
       </div>
        <div class="card">
            <div class="card-header">
                Edit Data
            </div>
            <div class="card-body">
                <form>
                    <div class="form-group">
                    <select v-model="select_prefix">
                <!-- <option style="width:20px;" value="">เลือกคำนำหน้า</option> -->
                <!-- <option :selected="this.selectedData == 2 "></option> -->
                    <!-- <option :selected="[this.selected === '2' ? 'selected' : '','']">Choose Province</option> -->
                    <option   :key="data.prefix_id" v-for="data in prefix_test" :value="data.prefix_id" >{{data.pre_th_name}}</option>
                    </select>
                    </div>
                    <div class="input-field col s12">
                              <!-- <label for="user_username">Username</label> -->
                              <input name="user_username" type="text" id="user_username" v-model="user_username" autocomplete="off" required placeholder="กรอกบัญชีผู้ใช้">
                            </div>

                            <div class="input-field col s12">
                              <!-- <label for="user_passwords">Password</label> -->
                              <input id="user_password" name="user_password" type="text" v-model="user_password" autocomplete="off" required placeholder="กรอกพาสเวิร์ด">
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
                <button class="btn btn-danger" @click="UpdateSend()">
                    แก้ไขข้อมูล
                </button>
            </div>
            
        </div>
    </div>
</template>

<script>
import axios from 'axios'
export default {
    name: 'Editar',
     data() {
      return {
      selected : '',
    //   selectedData: "Choose Province",
      prefix_data: '',
      sex_data: '',
      user_username: '',
      user_lastname: '',
      user_firstname: '',
      user_password : '',
      select_prefix: '',
      prefix_id: '',
      select_sex: '',
      prefix_test: []
      };
    },
    methods:{
        editData : function(){
        axios.get("http://localhost:3000/Fetchone/"+this.$route.params.user_username).then((res) => {
       // this.allData = res.data.data;
        this.user_username = res.data.data.user_username
        this.user_password = res.data.data.user_password
        this.user_firstname = res.data.data.user_firstname
        this.user_lastname = res.data.data.user_lastname
        this.select_prefix = res.data.data.prefix_id
    //    console.log("test")
       console.log(this.selected)
        //console.log(this.user_username)
        //console.log(res.data.data)
        // $(document).ready( function () {
        // $('#userTable').DataTable();
        // } );
      });
        },
    UpdateSend : function(){
       axios
        .post("http://localhost:3000/UpdateSpa", {
          user_username: this.user_username,
          user_password: this.user_password,
          user_firstname: this.user_firstname,
          user_lastname: this.user_lastname,
          prefix_id: this.select_prefix,
        })
        .then((res) => {
          alert("Update Successfully");
          window.location.reload("/Lista");
          console.log(res.data.data);
        });
    },

             fetchPrefix : function(){
          axios.get("http://localhost:3000/Prefix").then((response) =>{
          this.prefix_test = []
          this.prefix_test = response.data.data;
      //    console.log(this.prefix_test);
          })
      },
    },
    created : function(){
       this.editData();
       this.fetchPrefix();
    }
}
</script>