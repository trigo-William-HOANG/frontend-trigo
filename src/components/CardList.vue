<template>
  <div class="card-list">
    <div 
      class="card" 
      v-for="(card, index) in cards" 
      :key="index"
    >
      <div class="card-image" @click="goToApp(card.link)">
        <img :src="card.image" :alt="card.title">
        <div class="card-overlay">
          <h2 class="card-title">{{ card.title }}</h2>
        </div>
      </div>
      <!-- Section de contenu de la carte -->
      <!-- <div class="card-content">
        <p class="card-description">{{ card.description }}</p>
      </div> -->
    </div>
  </div>
</template>

<script setup>
import { defineProps } from 'vue';

// Définition des props pour recevoir la liste des cartes
const props = defineProps({
  cards: {
    type: Array,
    required: true,
    default: () => []
  }
});

// Fonction pour rediriger vers le lien de l'application
const goToApp = (link) => {
  // Si un lien est fourni, redirection
  if (link) {
    window.location.href = link;
  }
};
</script>

<style scoped>
.card-list {
  display: flex;
  flex-wrap: wrap;
  gap: 50px;
  justify-content: center;
  padding: 20px;
}

.card {
  background: #ffffff;
  border-radius: 15px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
  overflow: hidden;
  transition: transform 0.3s, box-shadow 0.3s;
  width: 300px;
  position: relative;
  cursor: pointer; 
}

.card:hover {
  transform: translateY(-5px);
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.card-image {
  position: relative;
  width: 100%;
  height: 300px;
}

.card img {
  width: 100%;
  height: 100%;
  object-fit: cover; 
  display: block;
}

.card-overlay {
  position: absolute;
  bottom: 0;
  left: 0;
  right: 0;
  height: 100px;
  background: linear-gradient(to top, rgba(0, 0, 0, 0.8), rgba(0, 0, 0, 0));
  display: flex;
  align-items: center;
  justify-content: center;
  opacity: 0;
  transition: opacity 0.3s;
}

.card:hover .card-overlay {
  opacity: 1;
}

.card-title {
  font-size: 1em;
  font-weight: bold;
  color: #ffffff;
  margin: 0;
  text-align: center;
  padding: 5px 10px;
}

/* Styles pour la section de contenu, actuellement non utilisés */
.card-content {
  padding: 10px;
}

.card-description {
  font-size: 0.9em;
  color: #666;
  text-align: center;
}
</style>
