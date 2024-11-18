<template>
    <Sidebar  />
    <Layout>
        <template #link class="pre-barre">
            <Button label="Créer une demande"/>
      <Searchbar class="barre" @update:search="updateSearchQuery" />
    </template>
        <template #content-title>
            <h1>DASHBOARD</h1>
        </template>
        <template #content-subtitle>
            <p>Trigoaccess</p>
        </template>
        <template #content>
            <div class="content-main">
            </div>
        </template>
    </Layout>
</template>






<script setup>
import Layout from "./../components/Layout.vue";
import Sidebar from "./../components/Sidebar.vue";
import Button from "./../components/Button.vue";
import Searchbar from "./../components/Searchbar.vue";


</script>
<style scoped>
/* CSS global */
body {
    overflow-x: hidden;
}


body.sidebar-closed .layout {
    margin-left: 60px;
    /* Ajuste le décalage lorsque la sidebar est fermée */
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
    margin-left: 230px;
    /* Décale le contenu pour s'ajuster à la sidebar ouverte */
}
</style>