<template>
  <div class="layout">
    <div class="navbar content">
      <nav>
        <div class="slot-link">
          <slot name="link"></slot>
        </div>
        <!-- <a href="#"><i class="bx bx-help-circle"></i></a> -->
        <a href="#" class="circle-user-dropdown">?</a>
      </nav>
    </div>

    <main>
      <div class="content-main">
        <div class="content-header">
          <div class="content-title">
            <slot name="content-title"></slot>
          </div>
          <div class="content-subtitle">
            <slot name="content-subtitle"></slot>
          </div>
        </div>
        <slot name="content"></slot>
      </div>
    </main>

    <footer>
      <slot name="footer"></slot>
    </footer>
  </div>
</template>

<script setup>
import { ref, onMounted } from "vue";

const currentPath = ref("");

// Set current path when component is mounted
onMounted(() => {
  currentPath.value = window.location.pathname;
});

// Function to check if a route is active
const isActive = (path) => {
  return currentPath.value === path ? "active" : "";
};
</script>

<style scoped>
.bx {
  font-size: 1.7rem;
}
a {
  text-decoration: none;
  color: white;
}
li {
  list-style: none;
}
html {
  overflow-x: hidden;
}

.content nav a {
  color: var(--bleutrigo) !important;
  height: 40px;
  width: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  border-radius: 50%;
}
.content nav p {
  color: var(--bleutrigo) !important;
  height: 40px;
  width: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  text-align: center;
  border-radius: 50%;
}
.content nav a:hover {
  color: white !important;
  background-color: var(--bleutrigo);
  border-radius: 50%;
}

.content .circle-user-dropdown {
  background: var(--bleutrigo);
  color: white !important;
  border-radius: 50%;
  height: 40px;
  width: 40px;
  display: flex;
  align-items: center;
  justify-content: center;
  
}


.content nav {
  height: 80px; /* Augmenter la hauteur de la navbar */
  background: var(--lightgristrigo);
  padding: 0 24px;
  display: flex;
  align-items: center;
  justify-content: center; /* Centrer les éléments horizontalement */
  grid-gap: 24px;
  position: sticky;
  top: 0;
  left: 0;
  z-index: 1000;
}

.content nav:before {
  content: "";
  position: absolute;
  width: 40px;
  height: 40px;
  bottom: -40px;
  left: 0;
  border-radius: 50%;
  box-shadow: -20 -20 0 var(--lightgristrigo);
}

.content nav .slot-link {
  display: flex;
  align-items: center;
  text-align: center;
  justify-content: center;
  color: var(--bleutrigo);
}

/* Ajuster la disposition de content-header pour que le subtitle soit en dessous du title */
.content-header {
  padding: 24px;
  display: flex;
  flex-direction: column; /* Disposer en colonne */
  align-items: center;
  justify-content: center;
}

.content-title {
  margin-bottom: 8px; /* Espacement entre le titre et le sous-titre */
}

.content-title h1 {
  font-size: 24px !important;
  text-align: center;
  margin: 0;
}

.content-subtitle {
  padding-top: 1%;
  font-size: 16px;
  text-align: center;
  color: grey; /* Correction pour utiliser une variable CSS */
}

.logo {
  position: absolute;
  top: 50%;
  left: 16px;
  transform: translateY(-50%);
  height: 90px; /* Ajuster la taille du logo si nécessaire */
  max-height: 100px;
  width: auto;
  margin: 0; /* Supprimer les marges pour un alignement correct */
}

/* Pour centrer le reste des éléments sur les côtés de la navbar */
.slot-link,
.circle-user-dropdown,
.bx {
  position: absolute;
  top: 50%; /* Positionnement vertical */
  transform: translateY(-50%); /* Centrage vertical */
}

.slot-link {
  left: 16px; /* Placer à gauche */
}

.circle-user-dropdown,
.bx {
  right: 16px; /* Placer à droite */
  display: flex;
  align-items: center;
  justify-content: center;
}
</style>
