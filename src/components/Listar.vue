<template>
  <div>
    MAD Dev
    <div class="card">
      <div class="card-header">Header</div>
      <div class="card-body">
        <table class="table">
          <thead>
            <tr>
              <th>User_username</th>
              <th>user_password</th>
              <th>user_firstname</th>
              <th>user_lastname</th>
              <th>Action</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="row in allData" :key="row.user_username">
              <td scope="row">{{ row.user_username }}</td>
              <td>{{ row.user_password }}</td>
              <td>{{ row.user_firstname }}</td>
              <td>{{ row.user_lastname }}</td>
              <td>
                <div>
                  <!-- <button type="button">แก้ไข</button> -->

                  <router-link
                    :to="{
                      name: 'Editar',
                      params: { user_username: row.user_username },
                    }"
                    class="btn btn-success"
                    >แก้ไข</router-link
                  >
                  <button
                    type="button"
                    v-on:click="deleteData(row.user_username)"
                    class="btn btn-danger"
                  >
                    ลบ
                  </button>
                </div>
                <!-- <a class="btn btn-primary">Update</a>
            <a class="btn btn-danger">Delete</a> -->
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
    <!-- <button @click="fetchAllData()">ปุ่หหหม</button> -->
    <!-- <div v-for ="row in allData" :key="row.user_username">
            <div>{{row.user_username}}</div>
            <div>{{row.user_password}}</div>
            <div>{{row.user_firstname}}</div>
            <div>{{row.user_lastname}}</div>
            <a class="btn btn-primary">Update</a>
            <a class="btn btn-primary">Delete</a>
        </div> -->
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "Listar",

  data() {
    return {
      allData: "",
      data_wang: "",
      deleteDataa: "",
    };
  },
  methods: {
    fetchAllData: function () {
      axios.get("http://localhost:3000/SelectSpa").then((res) => {
        this.allData = res.data.data;
        //console.log(res.data.data)
        // $(document).ready( function () {
        // $('#userTable').DataTable();
        // } );
      });
    },
    deleteData: function (user_username) {
      //console.log(user_username);
      axios
        .post("http://localhost:3000/deleteSpa", {
          user_username: user_username,
        })
        .then((res) => {
          alert("delete Successfully");
          window.location.reload("/Lista");
          console.log(res.data.data);
        });
    },
    //  editData(){
    //     axios.get("http://localhost:3000/Fetchone/").then((res) => {
    //     this.allData = res.data.data;
    //     //console.log(res.data.data)
    //     // $(document).ready( function () {
    //     // $('#userTable').DataTable();
    //     // } );
    //   });
    //     }
  },
  created() {
    this.fetchAllData();
  },
};
</script>
