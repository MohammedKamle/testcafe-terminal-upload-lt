// Save this file as test.js

// Save this file as test.js

import { Selector } from 'testcafe';

fixture('TestCafe example page').page(
  'https://devexpress.github.io/testcafe/example/'
);

test("Test 1", async user => {
  // To interact with a DOM element, we must use the Selector function
  const interfaceSelect = Selector('#preferred-interface');
  const interfaceOption = interfaceSelect.find('option');

  console.log('This is test 1')

  await user
    .typeText('#developer-name', 'Mohammed')

    .click('#remote-testing')
    .click(interfaceSelect)
    .click(interfaceOption.withText('Both'))
    .expect(interfaceSelect.value)
    .eql('Both')
    .click('#submit-button')
    .expect(Selector('#article-header').innerText)
    .eql('Thank you, Mohammed!');
});

test("Test 2", async user => {
  // To interact with a DOM element, we must use the Selector function
  const interfaceSelect = Selector('#preferred-interface');
  const interfaceOption = interfaceSelect.find('option');

  console.log('This is test 2')


  await user
    .typeText('#developer-name', 'Mohammed')

    .click('#remote-testing')
    .click(interfaceSelect)
    .click(interfaceOption.withText('Both'))
    .expect(interfaceSelect.value)
    .eql('Both')
    .click('#submit-button')
    .expect(Selector('#article-header').innerText)
    .eql('Thank you, Mohammed!');
});

test("Test 3", async user => {
  // To interact with a DOM element, we must use the Selector function
  const interfaceSelect = Selector('#preferred-interface');
  const interfaceOption = interfaceSelect.find('option');

  console.log('This is test 3')


  await user
    .typeText('#developer-name', 'Mohammed')

    .click('#remote-testing')
    .click(interfaceSelect)
    .click(interfaceOption.withText('Both'))
    .expect(interfaceSelect.value)
    .eql('Both')
    .click('#submit-button')
    .expect(Selector('#article-header').innerText)
    .eql('Thank you, Mohammed!');
});
