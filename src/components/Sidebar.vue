<template>
    <div class="sidebar" :class="{ 'close': hideMenu }">
      <div class="logo">
        <button @click="toggleSidebar">
          <i class="bx bx-menu"></i>
        </button>
        <img class="logoimg" src="./../assets/LogoTrigoRGB.jpg" alt="Logo de l'entreprise">
      </div>
  
      <ul class="side-menu">
        <li :class="isActive('/')">
          <a href="/">
            <i class="bx bx-home-alt-2"></i>
            <span class="menu-text">Accueil</span>
          </a>
        </li>
        <!-- <li :class="isActive('/commande')">
          <a href="/commande">
            <i class="bx bx-package"></i>
            <span class="menu-text">Mes commandes</span>
          </a>
        </li> -->
        <!-- Ajoutez d'autres éléments de menu comme nécessaire -->
      </ul>

      <div class="sidebar-footer">
        <a href="#" class="sidebar-logout">
          <i class="bx bx-log-out"></i>
          <span class="menu-text">Déconnexion</span>
        </a>
      </div>
    </div>
  </template>
  
  <script setup>
  import { ref, onMounted } from "vue";
  
  const hideMenu = ref(false);
  const currentPath = ref("");
  
  // Set current path when component is mounted
  onMounted(() => {
    currentPath.value = window.location.pathname;
  });
  
  const toggleSidebar = () => {
    hideMenu.value = !hideMenu.value;
    // Ajouter ou enlever la classe du layout principal pour ajuster le positionnement
    document.body.classList.toggle("sidebar-closed", hideMenu.value);
  };
  
  const isActive = (path) => {
    return currentPath.value === path ? "active" : "";
  };
  </script>
  
  <style scoped>

 
  .sidebar {
    position: fixed;
    top: 0;
    left: 0;
    background: var(--bleutrigo);
    width: 230px;
    height: 100%;
    z-index: 2000;
    overflow-x: hidden;
    transition: width 0.3s ease;
  }
  
  .sidebar.close {
    width: 60px; /* Réduit la largeur quand la sidebar est fermée */
  }
  
  .sidebar .logo {
    display: flex;
    align-items: center;
    padding: 15px;
  }
  
  .sidebar .logo button {
    font-size: 30px;
    background: var(--verttrigo);
    border: none;
    cursor: pointer;
    display: flex;
    justify-content: center;
    align-items: center;
    color: white;
    border-radius: 5px;
    
  }

  .sidebar .logo img {
    height: 70px; /* Ajuster la taille du logo si nécessaire */
    max-height: 100px;
  }
  
  .sidebar .side-menu li {
    display: flex;
    align-items: center;
    /* padding: 10px 15px; */
    margin: 10px 0;
    border-radius: 5px;
    transition: background 0.3s, padding 0.3s;
    overflow: hidden; /* Pour éviter les éléments qui débordent */
  }
  
  .sidebar .sidebar-footer{

    padding: 15px;
    background: var(--verttrigo);
    color: white;
    transition: background 0.3s;
    cursor: pointer;
    position: absolute;
    bottom: 0;
    width: 100%;
    text-align: center;
  }

  .sidebar .sidebar-footer .sidebar-logout {
    text-decoration: none;
    color: white;
  }

  .sidebar .side-menu li.active {
    background-color: var(--verttrigo);
  }
  
  .sidebar .side-menu li a {
    display: flex;
    align-items: center;
    width: 100%;
    color: white;
    text-decoration: none;
  }
  
  .sidebar .side-menu li a i {
    min-width: 40px; /* Assurez-vous que chaque icône a une largeur minimale pour ne pas se chevaucher */
    font-size: 1.5rem;
    text-align: center;
  }
  
  .sidebar .side-menu li a .menu-text {
    margin-left: 10px;
    white-space: nowrap;
    overflow: hidden;
    transition: opacity 0.3s ease;
  }
  
  .sidebar.close .logo img {
    opacity: 0;
  }
  .sidebar.close .logo button {
    font-size: 30px;
  }
  .sidebar.close .side-menu li a .menu-text {
    opacity: 0; /* Cache le texte du menu quand la sidebar est fermée */
    visibility: hidden;
    width: 0; /* Réduit la largeur du texte pour éviter le chevauchement */
  }
  
  .sidebar .side-menu li:hover {
    color: (--verttrigo);
  }
  
  
  
  </style>
  