import { describe as vdescribe, test, bench, expect } from 'vitest';

export const test_ = name => fn => () => test(name, fn);

export const testSkip_ = name => fn => () => test.skip(name, fn);

export const testSkipIf_ = cond => name => fn => () => test.skipIf(cond)(name, fn);

export const testRunIf_ = cond => name => fn => () => test.runIf(cond)(name, fn);

export const testOnly_ = name => fn => () => test.only(name, fn);

export const testConcurrent_ = name => fn => () => test.concurrent(name, fn);

export const testTodo = name => () => test.todo(name);

export const testFails_ = name => fn => () => test.fails(name, fn);

export const bench_ = name => time_ms => fn => () => bench(name, fn, { time: time_ms });

export const benchSkip_ = name => time_ms => fn => () => bench.skip(name, fn);

export const benchOnly_ = name => time_ms => fn => () => bench.only(name, fn, { time: time_ms });

export const benchTodo = name => () => bench.todo(name);

export const describe = name => fn => () => vdescribe(name, () => void fn());

export const describeSkip = name => fn => () => vdescribe.skip(name, () => void fn());

export const describeOnly = name => fn => () => vdescribe.only(name, () => void fn());

export const describeConcurrent = name => fn => () => vdescribe.concurrent(name, () => void fn());

export const describeShuffle = name => fn => () => vdescribe.shuffle(name, () => void fn());

export const describeTodo = name => () => vdescribe.todo(name);

export const expectToEqual_ = received => expected => () => expect(received).toStrictEqual(expected);

export const expectToNotEqual_ = received => expected => () => expect(received).not.toStrictEqual(expected);

export const expectToMatchSnapshot_ = received => () => expect(received).toMatchSnapshot();
