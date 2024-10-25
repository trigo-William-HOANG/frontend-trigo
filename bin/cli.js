#!/usr/bin/env node

const {execSync} = require('child_process');

const runCommand = command => {
    try{
        execSync(command, {stdio: 'inherit'});
        console.log(`Commande ${command} exécutée avec succès`);
    } catch(e){
        console.error(`Erreur lors de l'exécution de la commande : ${command}`);
        console.error(e.message);
        return false;               
    }
    return true;
}

const repoName = process.argv[2];
const gitCheckoutCommand = `git clone  https://github.com/trigo-William-HOANG/frontend-trigo ${repoName}`;
const installDepsCommand = `cd ${repoName} && npm install`;

console.log('Clonage du frontend TRIGO Web App');
const checkedOut = runCommand(gitCheckoutCommand);

if(!checkedOut)process.exit(1);

console.log('Installation des dépendances');
const installed = runCommand(installDepsCommand);
 if(!installed)process.exit(1);

console.log('Félicitations, le frontend TRIGO Web App a été installé avec succès! Si tu es prêt à utiliser, effectue les commandes suivantes');
console.log(`cd ${repoName} && npm install`);
