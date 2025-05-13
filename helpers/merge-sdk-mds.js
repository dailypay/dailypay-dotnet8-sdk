function createCombinedDocumentation(fullPath, outputName) {
  const fs = require('fs');
  const path = require('path');

  const projectRoot = path.resolve(__dirname, '..');
  const sourceDir = path.join(projectRoot, fullPath);
  const outputDir = path.join(projectRoot, 'documentation/' + outputName);
  const outputFile = path.join(outputDir, 'README.md');

  function getMarkdownFilesRecursively(dir) {
    let results = [];
    const list = fs.readdirSync(dir);
    list.forEach(file => {
      const fullPath = path.join(dir, file);
      const stat = fs.statSync(fullPath);
      if (stat && stat.isDirectory()) {
        results = results.concat(getMarkdownFilesRecursively(fullPath));
      } else if (file.endsWith('.md')) {
        results.push(fullPath);
      }
    });
    return results;
  }

  fs.mkdirSync(outputDir, { recursive: true });

  const files = getMarkdownFilesRecursively(sourceDir);
  const combined = files.map(file => {
    const content = fs.readFileSync(file, 'utf8');
    return `\n\n<!-- FILE: ${path.relative(sourceDir, file)} -->\n\n${content}`;
  }).join('\n');

  fs.writeFileSync(outputFile, combined, 'utf8');
  console.log("File written: " + outputFile);
}

createCombinedDocumentation('sdk/docs/sdks', 'sdk');
createCombinedDocumentation('sdk/docs/models/components', 'models/components');
createCombinedDocumentation('sdk/docs/models/errors', 'models/errors');
createCombinedDocumentation('sdk/docs/models/requests', 'models/requests');