Return-Path: <squashfs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+squashfs-devel@lfdr.de
Delivered-To: lists+squashfs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F06AF5274CA
	for <lists+squashfs-devel@lfdr.de>; Sun, 15 May 2022 03:17:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <squashfs-devel-bounces@lists.sourceforge.net>)
	id 1nq2sW-0001Il-Ts; Sun, 15 May 2022 01:16:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>) id 1nq2Xa-0000t8-BB
 for squashfs-devel@lists.sourceforge.net; Sun, 15 May 2022 00:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:From:References:Cc:To:Subject:
 MIME-Version:Date:Message-ID:Content-Type:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HS539zXQETWj0ELX/+iuIWdxJGh5lgIYjKEI9yAYZBA=; b=PswRwULu85Nd6zkx9N0Bf3udBL
 9L5qFEZdyTuiEHuC09UV43LxC6QNjBRU4Vni0f157j677wgyVFe0cVftLcj3PMU/mrpV5Gps+6XRZ
 KdFc1ZT0f7F/0g2pS92XgqCUhGv0LOGQh64REffCuifbmQ8hJBkR+t7vZifGbLvOkwsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
 Content-Type:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HS539zXQETWj0ELX/+iuIWdxJGh5lgIYjKEI9yAYZBA=; b=jS5VOTGcNvquGicZg1QrKMDs8L
 0+E3JGwLq8yYQ2OYGZuYQDg2sa7papG+KVwPOSqLk36Rn5LUgX06Z/wcQQ9kFuAlnBz5PBOtB126M
 LKTXkx7339OWzFVGIWxbVBq2zmuZNZVA5QWQUevA00QONZkOMlbVxvW9CF6ur/5T/1xI=;
Received: from p3plsmtp22-04-2.prod.phx3.secureserver.net ([68.178.252.60]
 helo=p3plwbeout22-04.prod.phx3.secureserver.net)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nq2XU-0001BH-6E
 for squashfs-devel@lists.sourceforge.net; Sun, 15 May 2022 00:55:17 +0000
Received: from mailex.mailcore.me ([94.136.40.143]) by :WBEOUT: with ESMTP
 id q2XHnBPsUSrnhq2XInTZ70; Sat, 14 May 2022 17:55:04 -0700
X-CMAE-Analysis: v=2.4 cv=fNb8YbWe c=1 sm=1 tr=0 ts=62804f68
 a=EhJYbXVJKsomWlz4CTV+qA==:117 a=84ok6UeoqCVsigPHarzEiQ==:17
 a=ggZhUymU-5wA:10 a=oZkIemNP1mAA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=FXvPX3liAAAA:8
 a=AuEceIlb4g7ZCpDxhjwA:9 a=QEXdDO2ut3YA:10 a=jxwgQWOI4D4vHzhjtTUA:9
 a=UObqyxdv-6Yh2QiB9mM_:22
X-SECURESERVER-ACCT: phillip@squashfs.org.uk  
X-SID: q2XHnBPsUSrnh
Received: from 82-69-79-175.dsl.in-addr.zen.co.uk ([82.69.79.175]
 helo=[192.168.178.33])
 by smtp05.mailcore.me with esmtpa (Exim 4.94.2)
 (envelope-from <phillip@squashfs.org.uk>)
 id 1nq2XG-0002ju-Du; Sun, 15 May 2022 01:55:03 +0100
Content-Type: multipart/mixed; boundary="------------QTUWKTb9K4TsTpr03WouSST9"
Message-ID: <d67b3646-9717-760c-1fc6-77c8a376ba38@squashfs.org.uk>
Date: Sun, 15 May 2022 01:54:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: Hsin-Yi Wang <hsinyi@chromium.org>
References: <PH0PR11MB519282C2834C7BB7B5431F34ECC79@PH0PR11MB5192.namprd11.prod.outlook.com>
 <Ynfzh2ifG85MZEoN@casper.infradead.org>
 <CAJMQK-jNYoJVqsri4REV=E3bG8AS7T82HrVSAUPzbUiWask01A@mail.gmail.com>
 <CAJMQK-i3OQxcG7=LzTG4k70BP0j6PstWw0C45xcEi6iVLn_2ag@mail.gmail.com>
 <CAEVVKH-m+3+xJMbM1vRM3d=AaPSv2xg4Qx8_WPw_29JByONS8A@mail.gmail.com>
 <YnkVaGB74xqWJqdG@casper.infradead.org>
 <CAJMQK-ie8_k3gfoWx4cRY8LwABVJ-801BEdW20A11cvP_rLRFQ@mail.gmail.com>
 <CAEVVKH_x1woe9teHN872P0P=8rc6bUtVmjuRBu7T=Qu-qP-MoQ@mail.gmail.com>
 <CAJMQK-jgNPvO+8xZph-MPs57DjDrVvhduxvHbtR_Hwd7+kZc-A@mail.gmail.com>
 <CAEVVKH9SuUFoR8SGP0tcB1fohW3nWRCVmSro_iDUVEV0NS2VqQ@mail.gmail.com>
 <CAJMQK-h3p72P=Ltpk9X1o6f56iKN6z=DimEtdGEUXf8cVabQOQ@mail.gmail.com>
 <adf436dd-d17d-7a84-68ba-0dd2125620cf@squashfs.org.uk>
 <CAJMQK-gQ+LD6t74FUwuxYVcmETgJxK8Q5_ZtuJvELm+yr=f8Yg@mail.gmail.com>
 <1f8a8009-1c05-d55c-08bd-89c5916e5240@squashfs.org.uk>
 <CAJMQK-gHZ_SEykcB7Ux6ccJ68NK=MrXpP=yXv6CLFc9knriAeQ@mail.gmail.com>
From: Phillip Lougher <phillip@squashfs.org.uk>
In-Reply-To: <CAJMQK-gHZ_SEykcB7Ux6ccJ68NK=MrXpP=yXv6CLFc9knriAeQ@mail.gmail.com>
X-Mailcore-Auth: 439999529
X-Mailcore-Domain: 1394945
X-123-reg-Authenticated: phillip@squashfs.org.uk  
X-Originating-IP: 82.69.79.175
X-CMAE-Envelope: MS4xfNanceSwkfDkEBRilk7lxuAbtYKD7vh81iTOlP7VNm8w5kd1toFJGPVDdGUeMGRwHkxnIELgnN0Ha1ppPMrp2rbEB/4orcC/MLbxaC3NH4Untj71xwI1
 PWeGVdTh0fdpoHCGBUlO6Y0kLbaNKwHb82MbU2hx4a+cpQnwB9dXuQAeLh8dAYXLhOjXuRHrAujkhhxvN1RMEhDXeYx4OC4BPDBZmmr7q5Z8s47Igzr3Z8UK
X-Spam-Score: -2.0 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 13/05/2022 07:35, Hsin-Yi Wang wrote: > On Fri, May 13,
 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk> wrote: >> >> My
 understanding is that this call will fully populate the >> pages ar [...]
 Content analysis details:   (-2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [68.178.252.60 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1nq2XU-0001BH-6E
X-Mailman-Approved-At: Sun, 15 May 2022 01:16:57 +0000
Subject: Re: [Squashfs-devel] squashfs performance regression and readahea
X-BeenThere: squashfs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <squashfs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=squashfs-devel>
List-Post: <mailto:squashfs-devel@lists.sourceforge.net>
List-Help: <mailto:squashfs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/squashfs-devel>, 
 <mailto:squashfs-devel-request@lists.sourceforge.net?subject=subscribe>
Cc: "Song, Xiongwei" <Xiongwei.Song@windriver.com>,
 Zhang Yi <yi.zhang@huawei.com>, Xiongwei Song <sxwjean@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Zheng Liang <zhengliang6@huawei.com>, Hou Tao <houtao1@huawei.com>,
 "squashfs-devel@lists.sourceforge.net" <squashfs-devel@lists.sourceforge.net>,
 Andrew Morton <akpm@linux-foundation.org>, Miao Xie <miaoxie@huawei.com>
Errors-To: squashfs-devel-bounces@lists.sourceforge.net

This is a multi-part message in MIME format.
--------------QTUWKTb9K4TsTpr03WouSST9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/05/2022 07:35, Hsin-Yi Wang wrote:
> On Fri, May 13, 2022 at 1:33 PM Phillip Lougher <phillip@squashfs.org.uk> wrote:
>>
>> My understanding is that this call will fully populate the
>> pages array with page references without any holes.  That
>> is none of the pages array entries will be NULL, meaning
>> there isn't a page for that entry.  In other words, if the
>> pages array has 32 pages, each of the 32 entries will
>> reference a page.
>>
> I noticed that if nr_pages < max_pages, calling read_blocklist() will
> have SQUASHFS errors,
> 
> SQUASHFS error: Failed to read block 0x125ef7d: -5
> SQUASHFS error: zlib decompression failed, data probably corrupt
> 
> so I did a check if nr_pages < max_pages before squashfs_read_data(),
> just skip the remaining pages and let them be handled by readpage.
> 

Yes that avoids passing the decompressor code a too small page range.
As such extending the decompressor code isn't necessary.

Testing your patch I discovered a number of cases where
the decompressor still failed as above.

This I traced to "sparse blocks", these are zero filled blocks, and
are indicated/stored as a block length of 0 (bsize == 0).  Skipping
this sparse block and letting it be handled by readpage fixes this
issue.

I also noticed a potential performance improvement.  You check for
"pages[nr_pages - 1]->index >> shift) == index" after calling
squashfs_read_data.  But this information is known before
calling squashfs_read_data and moving the check to before
squashfs_read_data saves the cost of doing a redundant block
decompression.

Finally I noticed that if nr_pages grows after the __readahead_batch
call, then the pages array and the page actor will be too small, and
it will cause the decompressor to fail.  Changing the allocation to 
max_pages fixes this.

I have rolled these fixes into the patch below (also attached in
case it gets garbled).

diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
index 7cd57e0d88de..14485a7af5cf 100644
--- a/fs/squashfs/file.c
+++ b/fs/squashfs/file.c
@@ -518,13 +518,11 @@ static void squashfs_readahead(struct 
readahead_control *ractl)
  	    file_end == 0)
  		return;

-	nr_pages = min(readahead_count(ractl), max_pages);
-
-	pages = kmalloc_array(nr_pages, sizeof(void *), GFP_KERNEL);
+	pages = kmalloc_array(max_pages, sizeof(void *), GFP_KERNEL);
  	if (!pages)
  		return;

-	actor = squashfs_page_actor_init_special(pages, nr_pages, 0);
+	actor = squashfs_page_actor_init_special(pages, max_pages, 0);
  	if (!actor)
  		goto out;

@@ -538,11 +536,18 @@ static void squashfs_readahead(struct 
readahead_control *ractl)
  			goto skip_pages;

  		index = pages[0]->index >> shift;
+
+		if ((pages[nr_pages - 1]->index >> shift) != index)
+			goto skip_pages;
+
  		bsize = read_blocklist(inode, index, &block);
+		if (bsize == 0)
+			goto skip_pages;
+
  		res = squashfs_read_data(inode->i_sb, block, bsize, NULL,
  					 actor);

-		if (res >= 0 && (pages[nr_pages - 1]->index >> shift) == index)
+		if (res >= 0)
  			for (i = 0; i < nr_pages; i++)
  				SetPageUptodate(pages[i]);

-- 
2.34.1



Phillip


>> This is important for the decompression code, because it
>> expects each pages array entry to reference a page, which
>> can be kmapped to an address.  If an entry in the pages
>> array is NULL, this will break.
>>
>> If the pages array can have holes (NULL pointers), I have
>> written an update patch which allows the decompression code
>> to handle these NULL pointers.
>>
>> If the pages array can have NULL pointers, I can send you
>> the patch which will deal with this.
> 
> Sure, if there are better ways to deal with this.
> 
> Thanks.
> 
>>
>> Thanks
>>
>> Phillip
>>
>>
>>
>>>
>>>>>
>>>>> It's also noticed that when the crash happened, nr_pages obtained by
>>>>> readahead_count() is 512.
>>>>> nr_pages = readahead_count(ractl); // this line
>>>>>
>>>>> 2) Normal cases that won't crash:
>>>>> [   22.651750] Block @ 0xb3bbca6, compressed size 42172, src size 262144
>>>>> [   22.653580] Block @ 0xb3c6162, compressed size 29815, src size 262144
>>>>> [   22.656692] Block @ 0xb4a293f, compressed size 17484, src size 131072
>>>>> [   22.666099] Block @ 0xb593881, compressed size 39742, src size 262144
>>>>> [   22.668699] Block @ 0xb59d3bf, compressed size 37841, src size 262144
>>>>> [   22.695739] Block @ 0x13698673, compressed size 65907, src size 131072
>>>>> [   22.698619] Block @ 0x136a87e6, compressed size 3155, src size 131072
>>>>> [   22.703400] Block @ 0xb1babe8, compressed size 99391, src size 131072
>>>>> [   22.706288] Block @ 0x1514abc6, compressed size 4627, src size 131072
>>>>>
>>>>> nr_pages are observed to be 32, 64, 256... These won't cause a crash.
>>>>> Other values (max_pages, bsize, block...) looks normal
>>>>>
>>>>> I'm not sure why the crash happened, but I tried to modify the mask
>>>>> for a bit. After modifying the mask value to below, the crash is gone
>>>>> (nr_pages are <=256).
>>>>> Based on my testing on a 300K pack file, there's no performance change.
>>>>>
>>>>> diff --git a/fs/squashfs/file.c b/fs/squashfs/file.c
>>>>> index 20ec48cf97c5..f6d9b6f88ed9 100644
>>>>> --- a/fs/squashfs/file.c
>>>>> +++ b/fs/squashfs/file.c
>>>>> @@ -499,8 +499,8 @@ static void squashfs_readahead(struct
>>>>> readahead_control *ractl)
>>>>>     {
>>>>>            struct inode *inode = ractl->mapping->host;
>>>>>            struct squashfs_sb_info *msblk = inode->i_sb->s_fs_info;
>>>>> -       size_t mask = (1UL << msblk->block_log) - 1;
>>>>>            size_t shift = msblk->block_log - PAGE_SHIFT;
>>>>> +       size_t mask = (1UL << shift) - 1;
>>>>>
>>>>>
>>>>> Any pointers are appreciated. Thanks!
>>>>
>>

--------------QTUWKTb9K4TsTpr03WouSST9
Content-Type: text/plain; charset=UTF-8; name="patch"
Content-Disposition: attachment; filename="patch"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2ZzL3NxdWFzaGZzL2ZpbGUuYyBiL2ZzL3NxdWFzaGZzL2ZpbGUuYwpp
bmRleCA3Y2Q1N2UwZDg4ZGUuLjE0NDg1YTdhZjVjZiAxMDA2NDQKLS0tIGEvZnMvc3F1YXNo
ZnMvZmlsZS5jCisrKyBiL2ZzL3NxdWFzaGZzL2ZpbGUuYwpAQCAtNTE4LDEzICs1MTgsMTEg
QEAgc3RhdGljIHZvaWQgc3F1YXNoZnNfcmVhZGFoZWFkKHN0cnVjdCByZWFkYWhlYWRfY29u
dHJvbCAqcmFjdGwpCiAJICAgIGZpbGVfZW5kID09IDApCiAJCXJldHVybjsKIAotCW5yX3Bh
Z2VzID0gbWluKHJlYWRhaGVhZF9jb3VudChyYWN0bCksIG1heF9wYWdlcyk7Ci0KLQlwYWdl
cyA9IGttYWxsb2NfYXJyYXkobnJfcGFnZXMsIHNpemVvZih2b2lkICopLCBHRlBfS0VSTkVM
KTsKKwlwYWdlcyA9IGttYWxsb2NfYXJyYXkobWF4X3BhZ2VzLCBzaXplb2Yodm9pZCAqKSwg
R0ZQX0tFUk5FTCk7CiAJaWYgKCFwYWdlcykKIAkJcmV0dXJuOwogCi0JYWN0b3IgPSBzcXVh
c2hmc19wYWdlX2FjdG9yX2luaXRfc3BlY2lhbChwYWdlcywgbnJfcGFnZXMsIDApOworCWFj
dG9yID0gc3F1YXNoZnNfcGFnZV9hY3Rvcl9pbml0X3NwZWNpYWwocGFnZXMsIG1heF9wYWdl
cywgMCk7CiAJaWYgKCFhY3RvcikKIAkJZ290byBvdXQ7CiAKQEAgLTUzOCwxMSArNTM2LDE4
IEBAIHN0YXRpYyB2b2lkIHNxdWFzaGZzX3JlYWRhaGVhZChzdHJ1Y3QgcmVhZGFoZWFkX2Nv
bnRyb2wgKnJhY3RsKQogCQkJZ290byBza2lwX3BhZ2VzOwogCiAJCWluZGV4ID0gcGFnZXNb
MF0tPmluZGV4ID4+IHNoaWZ0OworCisJCWlmICgocGFnZXNbbnJfcGFnZXMgLSAxXS0+aW5k
ZXggPj4gc2hpZnQpICE9IGluZGV4KQorCQkJZ290byBza2lwX3BhZ2VzOworCiAJCWJzaXpl
ID0gcmVhZF9ibG9ja2xpc3QoaW5vZGUsIGluZGV4LCAmYmxvY2spOworCQlpZiAoYnNpemUg
PT0gMCkKKwkJCWdvdG8gc2tpcF9wYWdlczsKKwogCQlyZXMgPSBzcXVhc2hmc19yZWFkX2Rh
dGEoaW5vZGUtPmlfc2IsIGJsb2NrLCBic2l6ZSwgTlVMTCwKIAkJCQkJIGFjdG9yKTsKIAot
CQlpZiAocmVzID49IDAgJiYgKHBhZ2VzW25yX3BhZ2VzIC0gMV0tPmluZGV4ID4+IHNoaWZ0
KSA9PSBpbmRleCkKKwkJaWYgKHJlcyA+PSAwKQogCQkJZm9yIChpID0gMDsgaSA8IG5yX3Bh
Z2VzOyBpKyspCiAJCQkJU2V0UGFnZVVwdG9kYXRlKHBhZ2VzW2ldKTsKIAotLSAKMi4zNC4x
Cgo=

--------------QTUWKTb9K4TsTpr03WouSST9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--------------QTUWKTb9K4TsTpr03WouSST9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Squashfs-devel mailing list
Squashfs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/squashfs-devel

--------------QTUWKTb9K4TsTpr03WouSST9--

