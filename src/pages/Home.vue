<template>
  <Layout>
    <template #link class="pre-barre">
      <Searchbar class="barre" @update:search="updateSearchQuery" />
    </template>
    <template #content-title>
      <h1>{{ title }}</h1>
    </template>
    <template #content-subtitle>
      <p>Vous pouvez trouver ici toutes les applications TRIGO</p>
    </template>
    <template #content>
      <div class="main">
        <CardList :cards="filteredCards" :isLoading="isLoading" />
      </div>
    </template>
  </Layout>
</template>

<script setup>
import Layout from "./../components/Layout.vue";
import CardList from "./../components/CardList.vue";
import Searchbar from "./../components/Searchbar.vue";
import app1 from '../assets/app1.webp';
import app2 from '../assets/app2.webp';
import app3 from '../assets/app3.webp';
import axios from 'axios';
import { ref, onMounted } from 'vue';

// Extraction des données pour afficher les applications
const cardData = [
  {
    image: app1,
    title: 'A 1',
    description: 'Description pour la carte 1.',
    link: '/test'
  },
  {
    image: app2,
    title: 'B 2',
    description: 'Description pour la carte 2.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  },
  {
    image: app3,
    title: 'C 3',
    description: 'Description pour la carte 3.',
    link: '#'
  }
];

const searchQuery = ref('');
const isLoading = ref(false);
const filteredCards = ref([]);
const title = ref('Applications');

// Simule un chargement asynchrone des données (comme un appel d'API)
const fetchCards = async (query) => {
  // isLoading.value = true;
  // await new Promise(resolve => setTimeout(resolve, 1000)); Simule un délai de 1 seconde
  // isLoading.value = false;

  // Filtrage des cartes en fonction de la recherche
  if (!query.trim()) {
    filteredCards.value = cardData;
  } else {
    filteredCards.value = cardData.filter(card =>
      card.title.toLowerCase().includes(query.toLowerCase())
    );
  }
};

// Met à jour la recherche et déclenche le chargement dynamique
const updateSearchQuery = (query) => {
  searchQuery.value = query;
  fetchCards(query); // Charge les cartes basées sur la recherche
};

// Charger les cartes initialement
fetchCards('');

onMounted(async () => {
  try {
    const response = await axios.get('http://localhost:8080/api/message');
    console.log(response.data.message);
    title.value = response.data.message;
  } catch (error) {
    console.error('Error fetching message:', error);
  }
});
</script>
<!-- A décommenter si on veut utiliser la sidebar -->
<style scoped>
/*
.layout {
  transition: margin-left 0.3s ease;
  margin-left: 230px; /* Décale le contenu pour s'ajuster à la sidebar ouverte */
  /*
}

body.sidebar-closed .layout {
  margin-left: 60px; /* Ajuste le décalage lorsque la sidebar est fermée */
  /*
}

.content-main {
  transition: all 0.3s ease;
  margin-top: 3%;
}

/* Contenu adapté au comportement de la sidebar */
body.sidebar-closed .content-main {
  margin-left: 60px;
}
.searchbar{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(183%, -50%);
}

</style>
