<template>
  <Sidebar />
    <Layout>
      
      <template #content-title>
        <h1>Diwi</h1>
      </template>
      <template #content-subtitle>
        <p>Vous pouvez trouver ici toutes les applications TRIGO</p>
      </template>
      <template #content>
      </template>
    </Layout>
  </template>
  
  <script setup>
  import Layout from "./../components/Layout.vue";
  import Sidebar from "./../components/Sidebar.vue";
  
  </script>
<style scoped>
/* CSS global */
body {
  overflow-x: hidden;
}


body.sidebar-closed .layout {
  margin-left: 60px; /* Ajuste le décalage lorsque la sidebar est fermée */
}

.content-main {
  transition: all 0.3s ease;
  margin-top: 3%;
}

/* Contenu adapté au comportement de la sidebar */
body.sidebar-closed .content-main {
  margin-left: 60px;
}

body.sidebar-closed .navbar nav img {
  display: block;
}
.navbar nav img {
  display: none;
}
.layout {
  transition: margin-left 0.3s ease;
  margin-left: 230px; /* Décale le contenu pour s'ajuster à la sidebar ouverte */
}
</style>